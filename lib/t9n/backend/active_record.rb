module Perfectline
  module T9n
    module Backend

      class ActiveRecord < ::I18n::Backend::Simple
        INTERPOLATION_RESERVED_KEYS = %w(scope default object)

        attr_accessor :default_backend
        attr_accessor :cache_storage

        def cache_enabled?
          return !@cache_storage.nil?
        end

        def cache_storage=(store)
          @cache_storage = ActiveSupport::Cache.lookup_store(store, {:namespace => "i18n"})
        end

        def initialize
          @default_backend  = I18n::Backend::Simple.new
          @cache_storage    = ActiveSupport::Cache.lookup_store(:mem_cache_store, {:namespace => "i18n"})
        end

        def reload!
          # don't do anything as passenger with multiple rails instances will screw up memcached
        end

        def available_locales
          begin
            ::Translation.available_locales.map(&:to_sym)
          rescue
            @default_backend.available_locales
          end
        end

        def store_translation(*args)
          raise MethodNotAllowed, "Create translation not allowed for Perfectline::I18n::Backend"
        end

        def translate(locale, key, options = {})
          if locale.nil?
            raise InvalidLocale.new(locale)
          end

          if key.is_a?(Array)
            return key.map{ |k| translate(locale, k, options) }
          end

          count   = options[:count]
          scope   = options.delete(:count)
          default = options.delete(:default)
          object  = options.delete(:object)
          values  = options.reject{ |name, value| INTERPOLATION_RESERVED_KEYS.include?(name.to_s) }
          entry   = lookup(locale, key, scope, object)

          if entry.nil?
            entry = default(locale, default, key, options) unless default === false

            if entry.nil?
              raise I18n::MissingTranslationData.new(locale, key, options)
            end
          end

          entry = pluralize(locale, entry, count)
          entry = interpolate(locale, entry, values)
          entry
        end

        protected

        def lookup(locale, key, scope = [], object = nil)
          # bail out instantly if key is nil
          return unless key

          scope_key = scope_key(scope, key)
          cache_key = cache_key(locale, key, scope, object)

          # check cache and ignore errors (string keys with spaces for AR error override messages)
          begin
            if result = cache_read(cache_key)
              return result
            end
          rescue => exception
            return nil
          end

          result = @default_backend.lookup(locale, key, scope)

          if result.nil?
            if object.kind_of?(::ActiveRecord::Base)
              result = ::Translation.locale(locale).for(object).lookup(scope_key)
            else
              result = ::Translation.orphans.locale(locale).lookup(scope_key)
            end

            if result.empty?
              result = nil
            elsif result.first.key == scope_key
              result = result.first.value
            else
              chop_range = (key.size + 1)..-1
              result = result.inject({}) do |hash, range|
                hash[range.key.slice(chop_range)] = range.value
                hash
              end

              result = deep_symbolize_keys(unwind_keys(result))
            end
          end

          # write to cache
          cache_write(cache_key, result)

          return result
        end

        def default(locale, default, key, options = {})
          begin
            case default
              when String then
                default
              when Symbol then
                translate(locale, default, options)
              when Array then
                default.map{ |obj| default(locale, obj, key, options.dup) }.compact!.first
              else
                # set default to false to avoid endless recursion
                unless I18n.default_locale?(locale)
                  translate(I18n.default_locale, key, options.merge(:default => false))
                end
            end
          rescue I18n::MissingTranslationData
            nil
          end
        end

        def cache_read(key)
          if cache_enabled?
            return @cache_storage.fetch(key)
          end
        end

        def cache_write(key, value)
          if cache_enabled? && (not value.blank?)
            @cache_storage.write(key, value)
          end
        end

        def cache_clear!
          if cache_enabled?
            @cache_storage.clear
          end
        end

        def cache_key(locale, key, scope, object)
          ::Translation.cache_key(locale, scope_key(scope, key), object)
        end

        def scope_key(scope, key)
          (Array(scope) + Array(key)).join(".")
        end

        # >> { "a.b.c" => "d", "a.b.e" => "f", "a.g" => "h", "i" => "j" }.unwind
        # => { "a" => { "b" => { "c" => "d", "e" => "f" }, "g" => "h" }, "i" => "j"}
        def unwind_keys(hash)
          result = {}
          hash.each do |key, value|
            keys = key.split(".")
            curr = result
            curr = curr[keys.shift] ||= {} while keys.size > 1
            curr[keys.shift] = value
          end
          result
        end

      end
    end
  end
end
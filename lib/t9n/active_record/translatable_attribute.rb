module Perfectline
  module T9n
    module TranslatableAttribute

      def self.included(base)
        base.__send__(:extend, ClassMethods)
        base.__send__(:include, InstanceMethods)
      end

      module ClassMethods

        def translated_attributes
          @translated_attributes ||= {}
        end

        def translate_attribute(attribute, options = {})
          if columns_hash.keys.include?(attribute.to_s)
            raise ArgumentError, "#{self.name} already has an attribute named :#{attribute}"
          end

          build_translated_attribute(attribute, options, false)
        end

        def translate_column(column, options = {})
          unless columns_hash.keys.include?(column.to_s)
            raise ArgumentError, "#{self.name} does not respond to column: :#{column}"
          end

          build_translated_attribute(column, options, true)
        end

        def build_translated_attribute(attribute, options, real_attribute)

          # build key
          key = "#{self.table_name}.#{((options.delete(:to) || attribute).to_s.gsub(/_/, "."))}"
          default = options.delete(:default) || "#{attribute}_default"

          # add the attribute name, default and type
          translated_attributes.store(attribute, {
                  :key            => key,
                  :default        => default,
                  :real_attribute => real_attribute
          })

          # create a separate method for accessing the original column
          if real_attribute
            define_method(default) do
              self[attribute.to_sym]
            end

            define_method("#{default}=") do |value|
              self[attribute.to_sym] = value
            end
          end

          define_method(attribute) do
            read_translatable_attribute(attribute, I18n.locale.to_s)
          end

          define_method("#{attribute}=") do |value|
            write_translatable_attribute(attribute, value, I18n.locale.to_s)
          end

          unless self.base_class.reflect_on_association(:translations)
            has_many :translations,
                     :as        => :translatable,
                     :dependent => :destroy,
                     :autosave  => true
          end

        end
      end

      module InstanceMethods

        def write_translatable_attribute(attribute, value, locale)
          options = self.class.translated_attributes.fetch(attribute.to_sym)

          if options.fetch(:real_attribute) && I18n.default_locale.to_s == locale
            __send__("#{options.fetch(:default)}=", value)
          else
            translation = translations.detect{ |t| t.key == options.fetch(:key) && t.locale == locale }
            translation = translations.build(:key => options.fetch(:key), :locale => locale) if translation.nil?
            translation.value = value
          end
        end

        def read_translatable_attribute(attribute, locale)
          options = self.class.translated_attributes.fetch(attribute.to_sym)

          if options.fetch(:real_attribute) && I18n.default_locale.to_s == locale
            __send__(options.fetch(:default))
          else
            translation = translations.detect{ |t| t.key == options.fetch(:key) && t.locale == locale}
            translation.nil? ? nil : translation.value
          end
        end

        def method_missing(method, *args, &block)
          if method.to_s.match(/^(#{self.class.translated_attributes.keys.map(&:to_s).join("|")})_([a-z]{2})(=)?$/)
            if $3 == "="
              write_translatable_attribute($1, args.first, $2)
            else
              read_translatable_attribute($1, $2)
            end
          else
            super
          end
        end

        def respond_to?(method, *args, &block)
          !method.to_s.match(/^(#{self.class.translated_attributes.keys.map(&:to_s).join("|")})_([a-z]{2})(=)?$/).nil? || super
        end

      end

    end
  end
end


module Perfectline
  module T9n
    module Backend
      module Extension

        def self.available_languages

          unless defined?(Language)
            throw RuntimeError, "Language model is not defined"
          end

          if self.backend.respond_to?(:available_languages)
            self.backend.available_languages
          end

        end

        def self.default_locale?(locale = nil)
          locale.nil? ? default_locale == self.locale : default_locale == locale.to_sym
        end

      end
    end
  end
end
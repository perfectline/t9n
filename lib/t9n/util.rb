require 'cgi'
require 'net/http'

module Perfectline
  module T9n
    class Util

      # sync non-default languages from the default one
      def self.populate
        ::Translation.locale(I18n.default_locale).each do |t|
          ::Translation.available_locales.reject!{ |locale| I18n.default_locale?(locale) }.each do |locale|
            unless ::Translation.locale(locale).exists?({:key => t.key, :translatable_id => t.translatable_id, :translatable_type => t.translatable_type})
              ::Translation.create!(
                      :locale             => locale,
                      :key                => t.key,
                      :value              => nil,
                      :translatable_id    => t.translatable_id,
                      :translatable_type  => t.translatable_type
              )
              puts "Translation::Populate created a new translation in :#{locale} with key '#{t.key}'"
            end
          end
        end
      end

      # translate from google
      def self.google_translate
        I18n.available_locales.reject!{ |locale| I18n.default_locale?(locale) }.each do |locale|
          ::Translation.locale(locale).untranslated.each do |translation|

            unless self.needs_human_eyes?(translation.value)
              interpolation = translation.value.scan(/\{\{(.*?)\}\}/).flatten

              if interpolation.empty?
                translation.update_attribute(:value, Perfectline::T9n::GoogleTranslator.translate(translation.value, locale, I18n.default_locale))
              else
                placeholders = {}

                # sub out interpolations
                interpolation.each do |argument|
                  placeholder = Time.now.to_i
                  translation.value.gsub!("{{#{argument}}}", placeholder)
                  placeholders[placeholder] = argument
                end

                # translate
                translated = Perfectline::T9n::GoogleTranslator.translate(translation.value, locale, I18n.default_locale)
                placeholders.each{|value, argument| translated.gsub!(value, "{{#{argument}}}")}

                translation.update_attribute(:value, translated)
              end
            end

          end
        end
      end

      private

      def self.needs_human_eyes?(value)
        return true if value.index('%') # date formats
        return true if value =~ /^---(.*)\n/ # YAML
      end

    end

    class GoogleTranslator

      def self.translate(text, to, from='en')

        base = 'http://ajax.googleapis.com/ajax/services/language/translate'

        # assemble query params
        params = {
                :langpair => "#{from}|#{to}",
                :q => text,
                :v => 1.0
        }

        query = params.map{ |k, v| "#{k}=#{CGI.escape(v.to_s)}" }.join('&')

        # send get request
        response = Net::HTTP.get_response( URI.parse( "#{base}?#{query}" ) )
        json = JSON.parse( response.body )

        if json['responseStatus'] == 200
          json['responseData']['translatedText']
        else
          raise StandardError, response['responseDetails']
        end
      end

    end
  end
end
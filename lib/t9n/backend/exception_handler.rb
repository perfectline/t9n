module Perfectline
  module T9n
    module Backend
      module ExceptionHandler

        def self.hoptoad_exception_handler(exception, locale, key, scope)
          unless defined?(HoptoadNotifier)
            throw RuntimeError, "HoptoadNotifier is not present, please get it from http://hoptoadapp.com/"
          end

          case exception
            when MissingTranslationData
              HoptoadNotifier.notify(exception)
            else
              raise exception
          end

          return exception.message
        end

      end
    end
  end
end
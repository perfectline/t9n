require "t9n/active_record/translatable_attribute"

# include translatable attribute
ActiveRecord::Base.__send__(:include, Perfectline::T9n::TranslatableAttribute)

require "t9n/backend/active_record"
require "t9n/backend/extension"
require "t9n/backend/exception_handler"

# include hoptoad notifier
I18n.__send__(:include, Perfectline::T9n::Backend::ExceptionHandler)
I18n.__send__(:include, Perfectline::T9n::Backend::Extension)

# include needed model logic modules
require "t9n/models/language"
require "t9n/models/translation"
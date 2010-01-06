# Set the I18n backend to use Perfectline::Translations
# Comment this line to revert back to the default, I18n::Simple backend
I18n.backend = Perfectline::T9n::Backend::ActiveRecord.new

# Configure I18n to use Hoptoad as its exception handler
# This means that in case of a missing translation it will nofity Hoptoad
# about the missing translation exception, instead of blowing the whole application up
#I18n.exception_handler = :hoptoad_exception_handler
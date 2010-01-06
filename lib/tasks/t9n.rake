namespace :translations do

  desc "Clear translations cache"
  task :clear => :environment do
    I18n.backend.cache_clear!
  end

  desc "Create empty translations keys from the default locale into other available locales"
  task :populate => :environment do
    Perfectline::T9n::Util.populate
  end

  desc "Uses google to translate untranslated values. No interpolation"
  task :google => :environment do
    Perfectline::T9n::Util.google_translate
  end
end


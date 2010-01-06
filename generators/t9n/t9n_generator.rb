class T9nGenerator < Rails::Generator::Base

  def manifest
    record do |m|

      unless options[:skip_models]
        m.directory File.join("app", "models")
        m.file      "language.rb",    "app/models/language.rb"
        m.file      "translation.rb", "app/models/translation.rb"
      end

      unless options[:skip_migrations]
        m.migration_template  "migrations/create_languages.rb",
                            "db/migrate",
                            :migration_file_name => "create_languages"

        m.migration_template "migrations/create_translations.rb",
                           "db/migrate",
                           :migration_file_name => "create_translations"
      end

      unless options[:skip_tasks]
        m.directory "lib/tasks"
        m.file      "/../../../lib/tasks/t9n.rake", "lib/tasks/t9n.rake"
      end

      unless options[:skip_initializer]
        m.directory "config/initializers"
        m.file      "initializer.rb", "config/initializers/t9n.rb"
      end
    end
  end

  protected

  def add_options!(opt)
    opt.separator ' '
    opt.separator 'Options:'

    opt.on        '--skip-migrations', "Dont generate migrations for the translations and languages tables" do |value|
      options[:skip_migrations] = value
    end

    opt.on        '--skip-models', "Dont generate Translation and Language models" do |value|
      options[:skip_models] = value
    end

    opt.on        '--skip-tasks', "Dont add translations raketasks to lib/tasks" do |value|
      options[:skip_tasks] = value
    end

    opt.on        '--skip-initializer', "Dont add the initializer in config/initializers" do |value|
      options[:skip_initializer] = value
    end
  end

end
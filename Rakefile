require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test
task :test    => :check_dependencies

begin
  require 'jeweler'
  Jeweler::Tasks.new do |jewel|
    jewel.name            = 't9n'
    jewel.summary         = 'Translation package including I18n AR backend, translatable attributes and Language database by PerfectLine'
    jewel.email           = ['tanel.suurhans@perfectline.ee', 'tarmo.lehtpuu@perfectline.ee']
    jewel.homepage        = 'http://perfectline.co.uk'
    jewel.description     = 'A custom AR backend for I18n, translatable model columns and virtual attributes, languages database with integration and some utilities.'
    jewel.authors         = ["Tanel Suurhans", "Tarmo Lehtpuu"]
    jewel.files           = FileList["lib/**/*.rb", "lib/tasks/*.rake", "*.rb", "rails/**/*.rb", "generators/**/*.rb", "MIT-LICENSE", "README.markdown"]
    jewel.add_dependency "activesupport"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

desc 'Test the T9n plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the T9n plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'T9n'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.markdown')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'rcov/rcovtask'

  desc 'Generate code coverage report'
  Rcov::RcovTask.new(:rcov) do |rcov|
    rcov.libs << 'test'
    rcov.test_files = FileList['test/*_test.rb']
    rcov.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install rcov"
  end
end

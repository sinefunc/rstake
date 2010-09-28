require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "rstake"
    gem.summary = "Watch a directory for changes."
    gem.description = "Watches a list of files for changes, and executes a given command when any changes are detected."
    gem.email = "rico@sinefunc.com"
    gem.homepage = "http://github.com/sinefunc/rstake"
    gem.authors = ["Rico Sta. Cruz", "Sinefunc, Iinc."]
    gem.add_dependency "growl", ">= 1.0.3"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

module RStake
  PREFIX = File.join(File.dirname(__FILE__), 'rstake')
  autoload :App,           "#{PREFIX}/app"
  autoload :PrintNotifier, "#{PREFIX}/print_notifier"
  autoload :Watcher,       "#{PREFIX}/watcher"
end


begin
  require 'growl'
  require "#{RStake::PREFIX}/growl_notifier"
rescue LoadError
end

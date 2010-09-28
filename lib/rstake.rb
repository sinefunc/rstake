module RStake
  PREFIX = File.join(File.dirname(__FILE__), 'rstake')
  autoload :App,           "#{PREFIX}/app"
  autoload :GrowlNotifier, "#{PREFIX}/growl_notifier"
  autoload :PrintNotifier, "#{PREFIX}/print_notifier"
  autoload :Watcher,       "#{PREFIX}/watcher"
end

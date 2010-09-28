module RStake
  class GrowlNotifier
    def initialize
      require 'growl'
    end

    def on_start(options={})
      Growl.notify_info "Waiting for changes on #{options[:count]} files.",
                        :title => "Watching changes"
    end

    def on_change(options={})
      Growl.notify "#{options[:files].join("\n")}\n\nRunning...",
                   :title      => "#{options[:files].size} files changed",
                   #:sticky     => true,
                   :identifier => "g#{options[:id]}"
    end

    def on_fail(options={})
      Growl.notify_error "The command exited with error #{options[:error].to_i}.",
                          :title      => "Failed",
                          :identifier => "g#{options[:id]}"
    end

    def on_success(options={})
      Growl.notify_ok "The command ran successfully.",
                      :title      => "Success!",
                      :identifier => "g#{options[:id]}"
    end
  end
end

module RStake
  class App
    attr_accessor :notifiers

    def initialize(command, files, options={})
      require 'shellwords'

      @command   = command
      @files     = Watcher.new(files)
      @notifiers = Array.new
      @options   = options
    end

    def notify(msg, *args)
      @notifiers.each { |n| n.send(msg, *args)  if n.respond_to?(msg) }
    end

    # Runs a command
    def exec(*a)
      @options[:async] ? fork { _exec(*a) } : _exec(*a)
    end

    def run!
      notify :on_start, :count => @files.size

      trap("INT") { notify :on_exit; exit }

      loop do
        sleep @options[:sleep_time]
        changes = @files.last_change
        exec changes  if changes.any?
      end
    end

  private

    # Delegate function of exec
    def _exec(files)
      @id     = (@id || 0) + 1
      command = @command.gsub('{}', files.shelljoin)
      options = { :id => @id, :files => files, :command => command }

      notify :on_change, options
      notify :on_exec,   options

      system command

      if $?.to_i > 0
        notify :on_fail, options.merge(:error => $?)
      else
        notify :on_success, options
      end
    end
  end
end

module RStake
  class PrintNotifier
    def on_start(options={})
      msg "Watching #{options[:count]} files, ^C to abort."
    end

    def on_fail(options={})
      msg_error "Done with errors; exited with #{options[:error]}."
      msg "Still watching..."
    end

    def on_success(options={})
      msg "Done. Still watching..."
    end

    def on_exit(options={})
      puts ''
      msg "Ctrl+C. That's all folks!"
    end

    def on_change(options={})
      msg "Changed #{options[:files].size} files (#{options[:files].join(', ')})"
    end

    def on_exec(options={})
      msg_command options[:command]
    end

  protected
    def msg(message, glyph='***', color_1=32, color_2=33)
      # 30 grey, 32 green, 31 red, 33 yellow
      warn "\033[1;#{color_1}m#{glyph}\033[1;#{color_2}m #{message}\033[0m"
    end

    def msg_command(message)
      msg message, '  >', 32, 30
    end

    def msg_error(message)
      msg message, '***', 31, 31
    end
  end
end

module RStake
  # Watches a list of files for changes.
  #
  # Common usage:
  #
  #     w = Watcher.new([file1, file2])
  #     w.last_change
  #
  class Watcher
    def initialize(files)
      @files = files
      @times = mtimes
    end

    # Returns an array of filenames that have been changed since it
    # was last called.
    def last_change
      new_times = mtimes
      ret = new_times.select { |k, v| @times[k] != v }
      @times = new_times
      ret.keys
    end

    # Returns a hash with filenames as keys, and their mtimes as values.
    def mtimes
      @files.inject({}) do |hash, g|
        Dir[g].each { |file| hash[file] = File.mtime(file) }
        hash
      end
    end

    def size
      @files.size
    end
  end
end

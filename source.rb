# Defines `Source` classes.

require 'open-uri'


class Source
  # Read char from a specific source.  Returns `nil` when source has been ended.
  # Ovveride this method in subclass to implement read char method.
  def read_chr
    raise NotImplementedError
  end
end


class FileSource < Source
  # @param [String] url A path to a file.
  def initialize(path)
    @file = File.open(path, 'r')
  end

  # Read char from a file.
  # Returns `nil` when source has been ended.
  def read_chr
    @file.getc unless @file.eof?
  end
end


class HTTPSource < FileSource
  # @param [String] url An url to source.
  def initialize(url)
    @file = open(url)
  end
end

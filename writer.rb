# Defines `Writer` classes.

class Writer
  # Ovveride this method in subclass to implement your own writer.
  # @param [String] string String to be written.
  def write
    raise NotImplementedError
  end
end


class FileWriter < Writer
  # Implements a writer for files.

  # @param [String] path Path to file.
  def initialize(path)
    @file = File.open(path, 'w')
  end

  # @param [String] string String to be written.
  def write(string)
    @file.write(string)
  end
end


class STDOutWriter < Writer
  # Implements a writer to stdout output.

  # @param [String] string String to be written.
  def write(string)
    print string
  end
end

# Defines `Formatter` classes.

class Formatter

  # @param [Hash] configurator Contains configuration keys:
  #     `spaces_num` -- Number of spaces are used for blocks alignment.
  #     `source` -- An instance of `Source` object.
  #     `writer` -- An instance of `Writer` object.
  def initialize(configurator)
    @spaces_num = configurator['spaces_num']
    @source = configurator['source']
    @writer = configurator['writer']
  end

  # Override this method in subclass to implement your own formatter.
  def format
      raise NotImplementedError
  end
end


class JavaFormatter < Formatter

  # Define specific symbols to be handled during formatting.
  NEWLINE = "\n"
  SPACE = " "
  EMPTY_STRING = ""
  OPEN_BRACKET = "{"
  CLOSE_BRACKET = "}"
  SEMICOLON = ";"
  SYMBOLS_TO_SKIP_REGEX = /[\s\t\r\n\f]/

  # Run this method to perform formatting.
  def format
    @nesting_level = 0
    @on_new_line = true
    while chr = @source.read_chr
      case chr
        when SYMBOLS_TO_SKIP_REGEX
          next
        when OPEN_BRACKET
          handle_open_bracket
        when CLOSE_BRACKET
          handle_close_bracket
        when SEMICOLON
          handle_semicolon
        else
          handle_symbol(chr)
      end
    end
  end

  private

  def handle_open_bracket
    @nesting_level += 1
    @writer.write(SPACE + OPEN_BRACKET)
    set_new_line
  end

  def handle_close_bracket
    @nesting_level -= 1
    @writer.write(get_indents + CLOSE_BRACKET)
    set_new_line
  end

  def handle_semicolon
    @writer.write(SEMICOLON)
    set_new_line
  end

  def handle_symbol(chr)
    @writer.write(get_indents + chr)
    @on_new_line = false
  end

  def set_new_line
    @writer.write(NEWLINE)
    @on_new_line = true
  end

  def get_indents
    if @nesting_level > 0 && @on_new_line
      return SPACE * @nesting_level * @spaces_num
    else
      return EMPTY_STRING
    end
  end
end

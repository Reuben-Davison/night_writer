require "./lib/convertable"

class BrailleTranslator
  include Convertable
  attr_reader :message, :converter_key, :output_message, :output_lines,
              :input, :output_location, :output

  def initialize(input, output)
    @input  = File.open(input, "r")
    @output = output
    @output_location = File.open(output, "w")
    @message = nil
    @output_message = nil
    @converter_key = {}
    @output_lines = [] 
    input_message
    deliver_message
  end

  def deliver_message
    # break_up_lines
    # @output_location.write(@output_message)
    prints_terminal_message
  end
  def message_to_row_array
    @message.delete("\n")
    
  end
  def convert_from_braille
    # @bt.message.delete("\n").chars.each_slice(2).map(&:join)
    @message.delete("\n")
  end

end 

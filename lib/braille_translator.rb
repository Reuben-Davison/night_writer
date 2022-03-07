require "./lib/convertable"

class BrailleTranslator
  include Convertable
  attr_reader :message, :converter_key, :output_message, :output_lines, :input, :output_location

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
     "this is a test"
    # break_up_lines
    # @output_location.write(@output_message)
    # prints_terminal_message
  end
  
  def convert_from_braille
  end

end 

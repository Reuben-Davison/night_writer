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
    single_line = @message.delete("\n").split("")
    row_length = single_line.length / 3
    single_line.each_slice(row_length).to_a
  end
  
  def convert_from_braille
    message = []
    braille_message = message_to_row_array
    library
    until message_to_row_array[0].count == 0
      letter_array = []
      braille_message.each {|row| letter_array << row.slice!(0..1).join}
      @converter_key.find {|letter, braille| message << letter if letter_array == braille}
    # require "pry"; binding.pry
    end 
    @output_message = message.join("").to_s
  end

end 

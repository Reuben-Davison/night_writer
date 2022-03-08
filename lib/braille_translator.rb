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
    convert_from_braille
    @output_location.write(@output_message)
    prints_terminal_message
  end
  
  def message_to_row_array
    line_array = []
    message = @message.split("\n")
    3.times {line_array << message.shift}
    until message.count == 0
      line_array[0] << message.shift
      line_array[1] << message.shift
      line_array[2] << message.shift
    end
    line_array 
  end
  
  def convert_from_braille
    message = []
    braille_message = message_to_row_array
    library
    until braille_message[0].length == 0
      letter_array = []
      braille_message.each {|row| letter_array << row.slice!(0..1)}
      @converter_key.find {|letter, braille| message << letter if letter_array == braille}
      # require "pry"; binding.pry
    end 
    @output_message = message.join("").to_s
  end

end 

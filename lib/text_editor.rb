require "./lib/convertable"

class TextEditor
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

  def convert_to_braille
    library
    number = 0 
    3.times do
      @output_lines << incoming_message_to_array.map {|letter| "#{converter_key[letter][number]}"}.join
      number += 1
    end
  end

  #unsure of how to test for this method
  def deliver_message
    convert_to_braille
    break_up_lines
    @output_location.write(@output_message)
    prints_terminal_message
  end
end 

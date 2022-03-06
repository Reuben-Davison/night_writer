require "./convertable.rb"

class TextEditor
  include Convertable
  attr_reader :message, :converter_key, :braille_message
  
  def initialize(input, output)
    @input  = File.open(input, "r")
    @output = output
    @output_location = File.open(output, "w")
    @message = nil
    @braille_message = nil
    @converter_key = {}
    input_message
    output_message
  end

  def input_message
    @message = @input.read.chomp
  end
  
  def output_message
    convert_to_braille
    # require "pry"; binding.pry
    @output_location.write(@braille_message)
  end

  def convert_to_braille
    library
    lines_of_braille = [] 
    number = 0 
    3.times do
      lines_of_braille << incoming_message_to_array.map {|letter| "#{converter_key[letter][number]}"}.join
      number += 1
    end
    @braille_message = lines_of_braille.join("\n") 
  end


end 

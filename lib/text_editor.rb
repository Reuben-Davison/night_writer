require "./convertable.rb"

class TextEditor
  include Convertable
  attr_reader :message, :converter_key, :braille_message
  
  def initialize(input, output)
    @input  = File.open(input, "r")
    @output = output
    @message = nil
    input_message
    @converter_key = {}
    @braille_message = nil
  end

  def input_message
    @message = @input.read.chomp
  end

  def prints_message 
    print "Created #{@output} containing #{@message.length} characters"
  end
  
  def incoming_message_to_array
    @message.downcase.split("")
  end
  
  def convert_to_braille
    number = 0
    new_message = incoming_message_to_array
    lines_of_braille = []
    3.times do
      lines_of_braille << new_message.map {|letter| "#{converter_key[letter][number]}"}.join
      number += 1
      require "pry"; binding.pry
    end 
  end


end 

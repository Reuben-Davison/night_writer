require "./convertable"

class TextEditor
  include Convertable
  attr_reader :message, :converter_key
  
  def initialize(input, output)
    @input  = File.open(input, "r")
    @output = output
    @message = nil
    input_message
    @converter_key = {}
  end

  def input_message
    @message = @input.read.chomp
  end

  def prints_message 
    print "Created #{@output} containing #{@message.length} characters"
  end
  
  def incoming_message_to_array
    @message.split("")
  end
  
  def convert_to_braille
    number = 0
    incoming_message_to_array.each {|letter| "#{converter_key["letter"][number]}"}
    require "pry"; binding.pry
    3.times do
      message = "#{hash[“a”][number]}#{hash[“b”][number]}#{}#{}#{}#{}"
      number += 1
    end
  
    
  end


end 

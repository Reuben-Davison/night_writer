require "./convertable"

class TextEditor
  include Convertable
  attr_reader :message
  
  def initialize(input, output)
    @input  = File.open(input, "r")
    @output = output
    @message = nil
    input_message
    # prints_message
  end

  def input_message
    @message = @input.read.chomp
  end

  def prints_message 
    print "Created #{@output} containing #{@message.length} characters"
  end


end 

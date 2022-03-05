require "./convertable"

class TextEditor
  include Convertable
  
  def initialize(input, output)
    @input  = File.open(input, "r")
    @output = output
    # prints_message
  end

  def input_message
    @input.read
  end

  def prints_message 
    print "Created #{@output} containing #{input_message.length} characters"
  end


end 

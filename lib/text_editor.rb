class TextEditor
  
  def initialize(input, output)
    @input  = File.open(input, "r")
    @output = output
    # @incoming = @input.read
    # message
    # require "pry"; binding.pry
  end

  def input_message
    @input.read
  end

  def prints_message 
    print "Created #{@output} containing #{input_message.length} characters"
  end


end 

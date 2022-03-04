class TextEditor
  
def initialize(input, output)
  @input  = File.open(input, "r")
  @output = output
  # require "pry"; binding.pry
end

def message 
  print "Created #{@output} containing #{@input.read.length} characters"
end


end 

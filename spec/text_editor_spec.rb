require "rspec"
require "./lib/text_editor"

RSpec.describe TextEditor do 
  before(:each) do
    @input  = 'message.txt'
    @output = 'braille.txt'
    @te = TextEditor.new(@input, @output) 
  end 
    
    it "exists" do
      expect(@te).to be_a TextEditor
    end
      
    it "can write a message" do
      # require "pry"; binding.pry
      expect{@te.prints_message}.to output('Created braille.txt containing 32 characters').to_stdout
    end
    
    it "has a method that stores incoming message" do
      expect(@te.input_message.chomp).to eq("Hello World this is a test file")

      
    end
    
    
 end 
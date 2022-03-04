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
      expect{@te.message}.to output('Created braille.txt containing 42 characters').to_stdout
      
    end
    
    
 end 

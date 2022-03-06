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
      
    it "can print a message" do
      expect{@te.prints_message}.to output('Created braille.txt containing 31 characters').to_stdout
    end
    
    it "has a method that stores incoming message" do
      expect(@te.message).to eq("Hello World this is a test file")
    end
    it "is connected to a module" do
      @te.library
      # require "pry"; binding.pry
      expect(@te.library).to eq(@te.converter_key)
    end
    it "converts letters to braille " do
      expect(@te.convert_to_braille("abc")).te eq("0.0.00\n..0...\n......")
      
    end
    
end 

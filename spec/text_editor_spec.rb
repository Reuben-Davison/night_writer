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
      expect{@te.prints_terminal_message}.to output('Created braille.txt containing 31 characters').to_stdout
    end
    
    it "has a method that stores incoming message" do
      expect(@te.message).to eq("Hello World this is a test file")
    end
    
    it "is connected to a module" do
      @te.library
      expect(@te.library).to eq(@te.converter_key)
    end
    
    it "splits the incoming message into an array" do
      expect(@te.incoming_message_to_array).to eq(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", " ", "t", "h", "i", "s", " ", "i", "s", " ", "a", " ", "t", "e", "s", "t", " ", "f", "i", "l", "e"])
    end
    
    it "converts letters to braille " do
      expect(@te.output_message).to eq("0.0.0.0.0....00.0.0.00...00..0.0...0.0..0....00..0.0..00.00.0.\n00.00.0..0..00.0000..0..00000.0...0.0.......00.00.00..0.0.0..0\n....0.0.0....00.0.0.....0.....0.....0.......0...0.0.......0...")
    end
    
    xit "sends converted braille_message to an a specified location" do
      expect('braille.txt').to eq @output_message
    end
    
    it "will only print out 40 letters at a time" do
      @input2 = 'message2.txt'
      @output2 = "braille2.txt"
      @te1 = TextEditor.new(@input2, @output2)
      expect(@te1.output_lines[0].length).to be <= 80
      expect(@te1.output_lines[5].length).to be <= 80
      expect(@te1.output_lines[-1].length).to be <= 80
      expect(@te1.output_lines.count).to eq 15
    end
    
end 

require "rspec"
require "./lib/braille_translator"

RSpec.describe BrailleTranslator do 
  
    before(:each) do
      @input  = 'braille.txt'
      @output = 'original_message.txt'
      @bt = BrailleTranslator.new(@input, @output) 
    end
    
    it "exists" do
      expect(@bt).to be_a BrailleTranslator
    end 
    
    it "can adapt output message" do
      expect{@bt.prints_terminal_message}.to output("Created #{@output} containing #{@bt.message.length} characters").to_stdout
    end 
    
    it "converts message into three arrays representing rows" do
      @input = 'braille5.txt'
      @output = 'abcoutput.txt'
      @bt2 = BrailleTranslator.new(@input, @output) 
      
      expect(@bt2.message_to_row_array).to eq([["0", ".", "0", ".", "0", "0"], [".", ".", "0", ".", ".", "."], [".", ".", ".", ".", ".", "."]])
    end
    
    it "converts braille to letters" do
      @bt.convert_from_braille
      expect(@bt.output_message).to eq("hello world this is a test file")
    end




end

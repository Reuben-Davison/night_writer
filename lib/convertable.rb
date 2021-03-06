module  Convertable
  
  def library
    @converter_key = 
    { 
      "a" => ["0.", "..", ".." ],
      "b" => ["0.", "0.", ".." ],
      "c" => ["00", "..", ".." ],
      "d" => ["00", ".0", ".." ],
      "e" => ["0.", ".0", ".." ],
      "f" => ["00", "0.", ".." ],
      "g" => ["00", "00", ".." ],
      "h" => ["0.", "00", ".." ],
      "i" => [".0", "0.", ".." ],
      "j" => [".0", "00", ".." ],
      "k" => ["0.", "..", "0." ],
      "l" => ["0.", "0.", "0." ],
      "m" => ["00", "..", "0." ],
      "n" => ["00", ".0", "0." ],
      "o" => ["0.", ".0", "0." ],
      "p" => ["00", "0.", "0." ],
      "q" => ["00", "00", "0." ],
      "r" => ["0.", "00", "0." ],
      "s" => [".0", "0.", "0." ],
      "t" => [".0", "00", "0." ],
      "u" => ["0.", "..", "00" ],
      "v" => ["0.", "0.", "00" ],
      "w" => [".0", "00", ".0" ],
      "x" => ["00", "..", "00" ],
      "y" => ["00", ".0", "00" ],
      "z" => ["0.", ".0", "00" ],  
      " " => ["..", "..", ".." ],  
    }
  end  
  
  def input_message
    @message = @input.read.chomp
  end
  
  def prints_terminal_message 
    print "Created #{@output} containing #{@message.length} characters"
  end
  
  def incoming_message_to_array
    @message.downcase.split("")
  end
  
  def  break_up_lines
      @output_lines.each do |line| 
        @output_lines << line.slice!(80..) if line.length > 80
      end 
  @output_message = @output_lines.join("\n") 
  end
  
end 

require "rspec"
require "./lib/night_writer"
# require "./message"
RSpec.describe do 
  it "exists" do
    night_writer = NightWriter.new('message.txt', 'braille.txt' ) 
    expect(night_writer).to be_a NightWriter
  end
  it "can take output from terminal" do
    expect(night_writer.output).to eq ARGV[1]
  end
  
  
  def printer
  number = 0
  hash = {
    “a” => [“11”, “00", “01”],
    “b” => [“xx”, “bb”, “yy”]
  }
  3.times do
    message = '#{hash[“a”][number]}#{hash[“b”][number]}#{}#{}#{}#{}'
    number += 1
    p message
  end
end
printer
message = “hello”
message.split
require “pry”; binding.pry


end  

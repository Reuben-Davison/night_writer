require "rspec"
require "./lib/night_writer"
# require "./message"
RSpec.describe NightWriter do 
  it "exist" do
    night_writer = NightWriter.new
    expect(night_writer).to be_a(NightWriter)
  end


end  

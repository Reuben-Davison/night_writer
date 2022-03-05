require "./lib/text_editor"
# input = File.open(ARGV[0], "r")
# output = File.open(ARGV[1], "w")
# print "Created #{ARGV[1]} containing #{input.read.length}  characters"
TextEditor.new(ARGV[0], ARGV[1])

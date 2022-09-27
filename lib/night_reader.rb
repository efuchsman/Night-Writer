require "./lib/braille_to_eng_converter"

braille_to_eng = BrailletoEngConverter.new
message = File.open(ARGV[0], "r")
message_reader = message.read
translator = braille_to_eng.translate_to_eng(message_reader)

new_file = File.open(ARGV[1], "w")
new_file.write(translator)

puts "Created #{ARGV[1]} containing #{translator.length} characters"

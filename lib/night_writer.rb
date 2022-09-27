require "./lib/eng_to_braille_converter"

eng_to_braille = EngtoBrailleConverter.new
message = File.open(ARGV[0], "r")
message_reader = message.read
translator = eng_to_braille.translate_to_braille(message_reader)

new_file = File.open(ARGV[1], "w")
new_file.write(translator)

puts "Created #{ARGV[1]} containing #{translator.length} characters"

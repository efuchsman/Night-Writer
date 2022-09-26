require "./lib/encryption_library"

encryption_library = EncryptionLibrary.new
message = File.open(ARGV[0], "r")
message_reader = message.read
translator = encryption_library.translate_input(message_reader)

new_file = File.open(ARGV[1], "w")
new_file.write(translator)

puts "Created #{ARGV[1]} containing #{translator.length} characters"

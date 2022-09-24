require "./lib/encryption_library"

encryption_library = EncryptionLibrary.new
message = File.open(ARGV[0], "r")
message_reader = message.read
brailler = encryption_library.word_translation(message_reader)
new_file = File.open(ARGV[1], "w")

encrypter = new_file.write(brailler)

puts "Created #{ARGV[1]} containing #{brailler.length} characters"

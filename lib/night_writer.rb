
message = File.open(ARGV[0], "r")
message_reader = message.read

new_file = File.open(ARGV[1], "w")

encrypter = new_file.write(message_reader)

puts "Created #{ARGV[1]} containing #{message_reader.length} characters"

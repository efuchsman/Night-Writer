
message = File.open(ARGV[0], "r")
message_reader = message.read

new_file = File.open(ARGV[1], "w")
writer = "but on the surface he looks calm and ready"
encrypter = new_file.write(writer)

puts "Created #{ARGV[1]} containing #{writer.length} characters"

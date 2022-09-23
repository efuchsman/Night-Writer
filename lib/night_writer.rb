message = File.open(ARGV[0], "r")
message_reader = message.read
message.close
decrypter = File.open(ARGV[1], "w")
decrypter.write("but on the surface he looks calm and ready")
decrypter.close

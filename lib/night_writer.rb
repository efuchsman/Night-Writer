class NightWriter

  attr_reader :filename

  def initialize(filename = 'message.txt')
    @filename = filename

  end

  def read_message
    file = File.readlines(@filename, chomp: true, headers: true, header_converters: :symbol)
     p file.join("','")[/\A"(.*)"\z/m,1]
  end

end

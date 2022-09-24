class EncryptionLibrary

  attr_reader :the_braille_alphabet,
              :braille_to_alphabet


  def initialize
    @the_braille_alphabet =
    {
      'a' => ['0.', '..', '..'],
      'b' => ['0.', '0.', '..'],
      'c' => ['00', '..', '..'],
      'd' => ['00', '.0', '..'],
      'e' => ['0.', '.0', '..'],
      'f' => ['00', '0.', '..'],
      'g' => ['00', '00', '..'],
      'h' => ['0.', '00', '..'],
      'i' => ['.0', '0.', '..'],
      'j' => ['.0', '00', '..'],
      'k' => ['0.', '..', '0.'],
      'l' => ['0.', '0.', '0.'],
      'm' => ['00', '..', '0.'],
      'n' => ['00', '.0', '0.'],
      'o' => ['0.', '.0', '0.'],
      'p' => ['00', '0.', '0.'],
      'q' => ['00', '00', '0.'],
      'r' => ['0.', '00', '0.'],
      's' => ['.0', '0.', '0.'],
      't' => ['.0', '00', '0.'],
      'u' => ['0.', '..', '00'],
      'v' => ['0.', '0.', '00'],
      'w' => ['.0', '00', '.0'],
      'x' => ['00', '..', '00'],
      'y' => ['00', '.0', '00'],
      'z' => ['0.', '.0', '00'],
      ' ' => ['..', '..', '..']
    }

    @braille_to_alphabet = @the_braille_alphabet.invert
  end

  def translate_input(string)\
    string.include?("0") ? braille_translation(string) : word_translation(string)
  end

  def word_translation(word)
    word_array = word.gsub("\n", "").downcase.chars
    braille_array = []
    word_array.each do |letter|
      braille_array << @the_braille_alphabet[letter]
    end
    transposed = braille_array.transpose
    transposed.map{ |subarray| subarray << "\n"}
    output = transposed.join.chomp
    p output
  end

  def braille_translation(braille)
    english_word = ""
    char_array = braille.gsub("\n", "").scan(/../)
    braille_array = char_array.each_slice(braille.length / 6).to_a
    transposed = braille_array.transpose
    transposed.each do |grouping|
      english_word += @braille_to_alphabet[grouping]
    end
    english_word
  end

  def formatter(output)

  end

end

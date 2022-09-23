class EncryptionLibrary

  attr_reader :the_braille_alphabet,
              :common_punctuation_marks,
              :the_braille_numbers,
              :braille_to_alphabet,
              :braille_to_punctuation,
              :braille_to_numbers

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
      'z' => ['0.', '.0', '00']
                                }
    @common_punctuation_marks =
    {
      ' ' => ['..', '..', '..'],
      '.' => ['..', '00', '.0'],
      '?' => ['..', '0.', '00'],
      '!' => ['..', '00', '0.'],
      "'" => ['..', '..', '0.'],
      ',' => ['..', '0.', '..'],
      '-' => ['..', '..', '00'],
    }

    @the_braille_numbers =
    {
      '0' => ['.0', '00', '..'],
      '1' => ['0.', '..', '..'],
      '2' => ['0.', '0.', '..'],
      '3' => ['00', '..', '..'],
      '4' => ['00', '.0', '..'],
      '5' => ['0.', '.0', '..'],
      '6' => ['00', '0.', '..'],
      '7' => ['00', '00', '..'],
      '8' => ['0.', '00', '..'],
      '9' => ['.0', '0.', '..'],
    }

    @braille_to_alphabet = @the_braille_alphabet.invert
    @braille_to_punctuation = @common_punctuation_marks.invert
    @braille_to_numbers = @the_braille_numbers.invert
  end

  def word_translation(word)
    word_array = word.downcase.chars
    braille_array = []
    word_array.each do |letter|
      @the_braille_alphabet.each_pair do |hash_letter, hash_braille|
        if letter == hash_letter
          braille_array << hash_braille
        end
      end
    end
    p braille_array
  end

end

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

  def word_translation(word)
    word_array = word.downcase.chars
    braille_array = []
    word_array.each do |letter|
      @the_braille_alphabet.each_pair do |hash_letter, hash_letter_braille|
        if letter == hash_letter
          braille_array << hash_letter_braille
        end
      end
    end
    braille_array
  end

  def braille_translation(braille)
    word_array = []
    braille_ea_char_array = braille.chars
    braille_every_2_array = braille_ea_char_array.each_slice(2).to_a
    join_em_array = braille_every_2_array.each_slice(1).map(&:join)
    join_em_again_array = join_em_array.each_slice(3).to_a
    join_em_again_array.each do |letter|
      @braille_to_alphabet.each_pair do |hash_letter_braille, hash_letter|
        if letter == hash_letter_braille
          word_array << hash_letter
        end
      end
    end
    word = word_array.join
    p word
  end

end

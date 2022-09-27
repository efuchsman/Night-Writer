require './lib/alphabetable'

class EngtoBrailleConverter

  include Alphabetable

  def translate_to_braille(string)
    braille_str = ""
    split_arr = string.chars.each_slice(40).map(&:join)
    split_arr.each do |str|
      braille_str += word_translation(str)
    end
    braille_str.chomp
  end

  def word_translation(str)
    word_array = str.gsub("\n", "").downcase.chars
    braille_array = []
    word_array.each do |letter|
      if !@the_braille_alphabet.keys.include?(letter)
        return "Invalid use of characters"
      else
      braille_array << @the_braille_alphabet[letter]
      end
    end
    transposed = braille_array.transpose
    transposed.map do |subarray|
      subarray << "\n"
    end
    transposed.join
  end
end

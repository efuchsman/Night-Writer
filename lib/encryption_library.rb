require './lib/alphabetable'

class EncryptionLibrary
include Alphabetable
  attr_reader :the_braille_alphabet,
              :braille_to_alphabet


  def translate_input(string)
    string.include?("0") ? translate_to_en(string) : translate_to_braille(string)
  end

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
      braille_array << @the_braille_alphabet[letter]
    end
    transposed = braille_array.transpose
    transposed.map do |subarray|
      subarray << "\n"
    end
    transposed.join
  end

  def translate_to_en(braille)
    english_string = ""
    braille_arr = braille.split("\n")
    grouped_arr = braille_arr.each_slice(3).to_a
    grouped_arr.each do |group|
      english_string += braille_translation(group)
    end
    english_string
  end

  def braille_translation(braille)
    english_string = ""
    char_array = braille.join.scan(/../)
    braille_array = char_array.each_slice(braille.join.length / 6).to_a

    transposed = braille_array.transpose
    transposed.each do |grouping|
      english_string += @braille_to_alphabet[grouping]
    end
    english_string
  end
end

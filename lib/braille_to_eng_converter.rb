require './lib/alphabetable'

class BrailletoEngConverter

  include Alphabetable

  def translate_to_eng(braille)
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
        if !@braille_to_alphabet.keys.include?(grouping)
          return "Invalid use of characters"
        else
        english_string += @braille_to_alphabet[grouping]
        end
      end
    english_string
  end
end

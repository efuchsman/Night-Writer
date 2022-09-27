require 'rspec'
require './lib/eng_to_braille_converter'
require 'pry-nav'

RSpec.describe EngtoBrailleConverter do
  it "exists" do
    eng_to_braille = EngtoBrailleConverter.new

    expect(eng_to_braille).to be_an_instance_of(EngtoBrailleConverter)
  end

  it "can return the braille alphabet" do
    eng_to_braille = EngtoBrailleConverter.new

    expect(eng_to_braille.the_braille_alphabet).to eq(
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
                                    )
  end

  it 'can convert a single english letter to braille' do
    eng_to_braille = EngtoBrailleConverter.new

    expect(eng_to_braille.translate_to_braille("e")).to eq("0.\n.0\n..")
  end

  it "can take an a word argument and convert it braille" do
    eng_to_braille = EngtoBrailleConverter.new

    expect(eng_to_braille.translate_to_braille("hello")).to eq(
      "0.0.0.0.0.\n00.00.0..0\n....0.0.0."
    )
  end

  it 'can start a new line at 80 characters' do
    eng_to_braille = EngtoBrailleConverter.new

    expect(eng_to_braille.translate_to_braille("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")).to eq("0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n0.\n..\n..")
  end

  it "does want to deal with invalid characters right now" do
    eng_to_braille_converter = EngtoBrailleConverter.new
    expect(eng_to_braille_converter.translate_to_braille("09i20j0ij**jd")).to eq("Invalid use of characters")
  end
end

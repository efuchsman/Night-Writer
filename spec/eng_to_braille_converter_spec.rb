require 'rspec'
require './lib/eng_to_braille_converter'
require 'pry-nav'

RSpec.describe EngtoBrailleConverter do
  it "exists" do
    braille_to_eng = EngtoBrailleConverter.new

    expect(braille_to_eng).to be_an_instance_of(EngtoBrailleConverter)
  end

  it "can return the braille alphabet" do
    braille_to_eng = EngtoBrailleConverter.new

    expect(braille_to_eng.the_braille_alphabet).to eq(
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

  it "can take an a word argument and convert it braille" do
    braille_to_eng = EngtoBrailleConverter.new

    expect(braille_to_eng.translate_to_braille("hello")).to eq(
      "0.0.0.0.0.\n00.00.0..0\n....0.0.0."
    )

  end
  it'can take braille and convert it to a word' do
    braille_to_eng = EngtoBrailleConverter.new

    expect(braille_to_eng.translate_to_en("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")).to eq("hello")
  end

  it 'can start a new line at 80 characters' do
    braille_to_eng = EngtoBrailleConverter.new

    expect(braille_to_eng.translate_to_braille("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")).to eq("0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n0.\n..\n..")
  end

  it "can convert over 80 braille characters to word" do
    braille_to_eng = EngtoBrailleConverter.new

    expect(braille_to_eng.translate_to_en("0.0.0.0.0...0.0..00000...00.0..0.0..0.00...00.0..0..0.0.0...000.0...0.00...00...\n00.00.0..0..00.000.0.0..0000..000.....0...0000..00....00.0...0.0......0...00.0..\n....0.0.0.....0..0..00...0....0.0...000....0....0.....0.....000.00..000...0.0...\n0..0000..0..000..0\n000.000000...0.000\n0.......0...0.0..0")).to eq("hello howdy whats up what are you up to right now")

  end

  it "can determine which translator to use based off of input" do
    braille_to_eng = EngtoBrailleConverter.new

    expect(braille_to_eng.translate_input("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")).to eq("hello")
    expect(braille_to_eng.translate_input("hello")).to eq("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
  end

  it "does want to deal with invalid characters right now" do
    braille_to_eng = EngtoBrailleConverter.new
    expect(braille_to_eng.translate_to_braille("09i20j0ij**jd")).to eq("Invalid use of characters")
    expect(braille_to_eng.translate_to_en("0.2.0.0.0.\n00.50.0..0\n....0.0.0.")).to eq("Invalid use of characters")
    expect(braille_to_eng.translate_input("09i20j0ij**jd")).to eq("Invalid use of characters")
    expect(braille_to_eng.translate_input("0.2.0.0.0.\n00.50.0..0\n....0.0.0.")).to eq("Invalid use of characters")
  end

end

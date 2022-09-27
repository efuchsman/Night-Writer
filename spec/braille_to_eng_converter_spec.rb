require 'rspec'
require './lib/braille_to_eng_converter'
require 'pry-nav'

RSpec.describe BrailletoEngConverter do
  it "exists" do
    braille_to_eng = BrailletoEngConverter.new

    expect(braille_to_eng).to be_an_instance_of(BrailletoEngConverter)
  end

  it 'can reverse the output based on braille input for the alphabet' do
    braille_to_eng = BrailletoEngConverter.new

    expect(braille_to_eng.braille_to_alphabet).to eq(
      {
        ['0.', '..', '..'] => 'a',
        ['0.', '0.', '..'] => 'b',
        ['00', '..', '..'] => 'c',
        ['00', '.0', '..'] => 'd',
        ['0.', '.0', '..'] => 'e',
        ['00', '0.', '..'] => 'f',
        ['00', '00', '..'] => 'g',
        ['0.', '00', '..'] => 'h',
        ['.0', '0.', '..'] => 'i',
        ['.0', '00', '..'] => 'j',
        ['0.', '..', '0.'] => 'k',
        ['0.', '0.', '0.'] => 'l',
        ['00', '..', '0.'] => 'm',
        ['00', '.0', '0.'] => 'n',
        ['0.', '.0', '0.'] => 'o',
        ['00', '0.', '0.'] => 'p',
        ['00', '00', '0.'] => 'q',
        ['0.', '00', '0.'] => 'r',
        ['.0', '0.', '0.'] => 's',
        ['.0', '00', '0.'] => 't',
        ['0.', '..', '00'] => 'u',
        ['0.', '0.', '00'] => 'v',
        ['.0', '00', '.0'] => 'w',
        ['00', '..', '00'] => 'x',
        ['00', '.0', '00'] => 'y',
        ['0.', '.0', '00'] => 'z',
        ['..', '..', '..'] => ' '
                                  }
                                    )
  end

  it 'can convert a a braille letter to an english letter' do
    braille_to_eng = BrailletoEngConverter.new

    expect(braille_to_eng.translate_to_eng("0.\n.0\n..")).to eq("e")
  end

  it'can take braille and convert it to a word' do
    braille_to_eng = BrailletoEngConverter.new

    expect(braille_to_eng.translate_to_eng("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")).to eq("hello")
  end

  it "can convert over 80 braille characters to word" do
    braille_to_eng = BrailletoEngConverter.new

    expect(braille_to_eng.translate_to_eng("0.0.0.0.0...0.0..00000...00.0..0.0..0.00...00.0..0..0.0.0...000.0...0.00...00...\n00.00.0..0..00.000.0.0..0000..000.....0...0000..00....00.0...0.0......0...00.0..\n....0.0.0.....0..0..00...0....0.0...000....0....0.....0.....000.00..000...0.0...\n0..0000..0..000..0\n000.000000...0.000\n0.......0...0.0..0")).to eq("hello howdy whats up what are you up to right now")
  end

  it "does want to deal with invalid characters right now" do
    braille_to_eng = BrailletoEngConverter.new

    expect(braille_to_eng.translate_to_eng("0.2.0.0.0.\n00.50.0..0\n....0.0.0.")).to eq("Invalid use of characters")
  end
end

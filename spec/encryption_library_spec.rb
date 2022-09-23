require 'rspec'
require './lib/encryption_library'

RSpec.describe EncryptionLibrary do
  it "exists" do
    encryption_library = EncryptionLibrary.new

    expect(encryption_library).to be_an_instance_of(EncryptionLibrary)
  end

  it "can return the braille alphabet" do
    encryption_library = EncryptionLibrary.new

    expect(encryption_library.the_braille_alphabet).to eq(
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
                                    )
  end

  it 'can return common punctuation marks' do
    encryption_library = EncryptionLibrary.new

    expect(encryption_library.common_punctuation_marks).to eq(
      {
        ' ' => ['..', '..', '..'],
        '.' => ['..', '00', '.0'],
        '?' => ['..', '0.', '00'],
        '!' => ['..', '00', '0.'],
        "'" => ['..', '..', '0.'],
        ',' => ['..', '0.', '..'],
        '-' => ['..', '..', '00'],
        letter_shift: ['..', '..', '.0']
      }
    )
  end

  it 'can return braille numbers' do
    encryption_library = EncryptionLibrary.new

    expect(encryption_library.the_braille_numbers).to eq(
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
        number_shift: ['.0', '.0', '00']
      }
    )
  end

end

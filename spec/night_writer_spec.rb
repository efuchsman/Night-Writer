require 'rspec'
require './lib/night_writer.rb'

RSpec.describe NightWriter do
  it 'exists' do
    night_writer = NightWriter.new('./text/message.txt')

    expect(night_writer).to be_an_instance_of(NightWriter)

  end

  it "can has readable attributes" do
    night_writer = NightWriter.new('./text/message.txt')

    expect(night_writer.filename).to eq('./text/message.txt').or(eq('./text/braille'))

  end

end

require_relative '../spec_helper.rb'
require_relative '../../lib/character_card.rb'
require 'json'
require 'crack'

describe PathfinderDeckBuilder::CharacterCard do
  before {@character_card = PathfinderDeckBuilder::CharacterCard.new(Crack::XML.parse(File.read('spec/Aer.xml')))}

  it "#static_content returns nil" do
    expect(@character_card.static_content).to eq(nil)
  end
end
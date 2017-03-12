require_relative '../spec_helper.rb'
require_relative '../../lib/special_ability_card.rb'
require 'json'
require 'crack'

describe PathfinderDeckBuilder::SpecialAbilityCard do 
  before {@special_ability_card = PathfinderDeckBuilder::SpecialAbilityCard.new(Crack::XML.parse(File.read('spec/Aer.xml')))}

  it "#static_content returns a hash" do
    expect(@special_ability_card.static_content).to eq({
      "count": 1,
      "color": "green",
      "title": "Special Ability",
      "icon": "magic-swirl"
    } )
  end
end
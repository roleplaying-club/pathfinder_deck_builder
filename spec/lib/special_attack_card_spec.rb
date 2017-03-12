require_relative '../spec_helper.rb'
require_relative '../../lib/special_attack_card.rb'
require 'json'
require 'crack'

describe PathfinderDeckBuilder::SpecialAttackCard do 
  before {@special_attack_card = PathfinderDeckBuilder::SpecialAttackCard.new(Crack::XML.parse(File.read('spec/Aer.xml')))}

  it "#static_content returns a hash" do
    expect(@special_attack_card.static_content).to eq({
      "count": 1,
      "color": "green",
      "title": "Special Attack",
      "icon": "wyvern"
    })
  end
end
require_relative '../spec_helper.rb'
require_relative '../../lib/armor_card.rb'
require 'json'
require 'crack'

describe PathfinderDeckBuilder::ArmorCard do 
  before {@armor_card = PathfinderDeckBuilder::ArmorCard.new(Crack::XML.parse(File.read('spec/Aer.xml')))}

  it "#static_content returns a hash" do
    expect(@armor_card.static_content).to eq({
      "count": 1,
      "color": "grey",
      "title": "Armor",
      "icon": "anvil"
    })
  end
end
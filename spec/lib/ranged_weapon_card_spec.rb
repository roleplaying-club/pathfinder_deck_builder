require_relative '../spec_helper.rb'
require_relative '../../lib/ranged_weapon_card.rb'
require 'json'
require 'crack'

describe PathfinderDeckBuilder::RangedWeaponCard do 
  before {@ranged_weapon_card = PathfinderDeckBuilder::RangedWeaponCard.new(Crack::XML.parse(File.read('spec/Aer.xml')))}

  it "#static_content returns a hash" do
    expect(@ranged_weapon_card.static_content).to eq({
      "count": 1,
      "color": "green",
      "title": "Ranged Weapon",
      "icon": "bowman"
    })
  end
end
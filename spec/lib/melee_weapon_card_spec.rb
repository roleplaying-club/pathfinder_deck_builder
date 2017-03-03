require_relative '../spec_helper.rb'
require_relative '../../lib/melee_weapon_card.rb'
require 'json'
require 'crack'

describe MeleeWeaponCard do 
  before {@melee_weapon_card = MeleeWeaponCard.new(Crack::XML.parse(File.read('spec/Aer.xml')))}

  it "#static_content returns a hash" do
    expect(@melee_weapon_card.static_content).to eq({
      "count": 1,
      "color": "red",
      "title": "Melee Weapon",
      "icon": "battle-axe"
    })
  end
end
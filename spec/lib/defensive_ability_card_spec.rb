require_relative '../spec_helper.rb'
require_relative '../../lib/defensive_ability_card.rb'
require 'json'
require 'crack'

describe DefensiveAbilityCard do 
  before {@defensive_ability_card = DefensiveAbilityCard.new(Crack::XML.parse(File.read('spec/Aer.xml')))}

  it "#static_content returns a hash" do
    expect(@defensive_ability_card.static_content).to eq({
      "count": 1,
      "color": "green",
      "title": "Defensive Ability",
      "icon": "spiked-shell"
    })
  end
end
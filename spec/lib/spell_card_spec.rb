require_relative '../spec_helper.rb'
require_relative '../../lib/spell_card.rb'
require 'json'
require 'crack'

describe SpellCard do 
  before {@spell_card = SpellCard.new(Crack::XML.parse(File.read('spec/Aer.xml')))}

  it "#static_content returns a hash" do
    expect(@spell_card.static_content).to eq({
      "count": 1,
      "color": "green",
      "title": "Spell"
    })
  end
end
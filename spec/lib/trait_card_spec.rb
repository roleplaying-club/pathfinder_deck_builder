require_relative '../spec_helper.rb'
require_relative '../../lib/trait_card.rb'
require 'json'

describe TraitCard do 
  
  before {@trait_card = TraitCard.new}

  it "#static_content returns a hash" do
    expect(@trait_card.static_content).to eq({
      "count": 1,
      "color": "green",
      "title": "Trait",
      "icon": "usable"
    })
  end
end
require_relative '../spec_helper.rb'
require_relative '../../lib/feat_card.rb'
require 'json'
require 'crack'

describe PathfinderDeckBuilder::FeatCard do 
  before {@feat_card = PathfinderDeckBuilder::FeatCard.new(Crack::XML.parse(File.read('spec/Aer.xml')))}

  it "#static_content returns a hash" do
    expect(@feat_card.static_content).to eq({
      "count": 1,
      "color": "green",
      "title": "Feat",
      "icon": "foot-trip" 
    })
  end
end
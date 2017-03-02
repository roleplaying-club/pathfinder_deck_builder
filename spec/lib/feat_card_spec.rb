require_relative '../spec_helper.rb'
require_relative '../../lib/feat_card.rb'
require 'json'
require 'crack'

describe ArmorCard do 
  before {@feat_card = FeatCard.new(Crack::XML.parse(File.read('spec/Aer.xml')))}

  it "#static_content returns a hash" do
    expect(@feat_card.static_content).to eq({
      "count": 1,
      "color": "green",
      "title": "Feat",
      "icon": "foot-trip" 
    })
  end
end
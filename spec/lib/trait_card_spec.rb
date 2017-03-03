require_relative '../spec_helper.rb'
require_relative '../../lib/trait_card.rb'
require 'json'
require 'crack'

describe TraitCard do 
  before {@trait_card = TraitCard.new(Crack::XML.parse(File.read('spec/Aer.xml')))}

  it "#static_content returns a hash" do
    expect(@trait_card.static_content).to eq({
      "count": 1,
      "color": "green",
      "title": "Trait",
      "icon": "usable"
    })
  end

  it "#set_class_path sets up the appropriate path" do
    expect(@trait_card.class_path).to eq(@trait_path)
    @trait_card.set_class_path
  end
end
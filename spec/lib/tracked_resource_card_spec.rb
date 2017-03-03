require_relative '../spec_helper.rb'
require_relative '../../lib/tracked_resource_card.rb'
require 'json'
require 'crack'

describe TrackedResourceCard do 
  before {@tracked_resource_card = TrackedResourceCard.new(Crack::XML.parse(File.read('spec/Aer.xml')))}

  it "#static_content returns a hash" do
    expect(@tracked_resource_card.static_content).to eq({
      "count": 1,
      "color": "purple",
      "title": "Tracked Resource",
      "icon": "checkbox-tree"
    })
  end
end
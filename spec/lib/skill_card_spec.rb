require_relative '../spec_helper.rb'
require_relative '../../lib/skill_card.rb'
require 'json'
require 'crack'

describe SkillCard do 
  before {@skill_card = SkillCard.new(Crack::XML.parse(File.read('spec/Aer.xml')))}

  it "#static_content returns a hash" do
    expect(@skill_card.static_content).to eq({
      "count": 1,
      "color": "orange",
      "title": "Skill",
      "icon": "gears"
    })
  end
end
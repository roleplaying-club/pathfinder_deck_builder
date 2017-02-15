require_relative '../spec_helper.rb'
require_relative '../../lib/card.rb'
require 'json'
require 'crack'

describe Card do 

  context "with one party member" do
    before { @card = Card.new(Crack::XML.parse(File.read('spec/Aer.xml'))) }
    
    it "#set_paths" do
      expect(@card).to receive(:set_single_character_path)
      @card.set_paths
    end
  end

  context "with more than one party member" do
    before { @card = Card.new(Crack::XML.parse(File.read('spec/Fellowship.xml'))) }
    before { @card.index = 0 }
    it "#set_paths" do
      expect(@card).to receive(:set_multiple_character_path)
      @card.set_paths
    end
  end
end
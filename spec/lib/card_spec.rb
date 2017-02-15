require_relative '../spec_helper.rb'
require_relative '../../lib/card.rb'
require 'json'
require 'crack'

describe Card do 
  before { @card = Card.new(Crack::XML.parse(File.read('spec/Aer.xml'))) }

  describe "#create_card" do
    it "calls #set_paths on itself" do 
      expect(@card).to receive(:set_paths)
      @card.create_card
    end

    it "calls #set_class_path on itself" do
      expect(@card).to receive(:set_class_path)
      @card.create_card
    end
  end

  describe "#set_paths" do
    context "with one party member" do
      before { @card = Card.new(Crack::XML.parse(File.read('spec/Aer.xml'))) }
    
      it "calls #set_single_character_path on itself" do
        expect(@card).to receive(:set_single_character_path)
        @card.set_paths
      end
    end

    context "with more than one party member" do
      before { @card = Card.new(Crack::XML.parse(File.read('spec/Fellowship.xml'))) }
      before { @card.index = 0 }

      it "calls #set_multiple_character_path on itself" do
        expect(@card).to receive(:set_multiple_character_path)
        @card.set_paths
      end
    end
  end
end
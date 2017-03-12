require_relative '../spec_helper.rb'
require_relative '../../lib/compiler.rb'
require 'json'
require 'crack'

describe PathfinderDeckBuilder::Compiler do
  before {@single_character = PathfinderDeckBuilder::Compiler.new('spec/Aer.xml')}
  before {@multiple_characters = PathfinderDeckBuilder::Compiler.new('spec/Fellowship.xml')}

  describe "#is_party?" do
    context "with one party member" do
      it "returns false" do
        expect(@single_character.is_party?).to eq(false)
      end
    end

    context "with multiple party members" do
      it "returns true" do
        expect(@multiple_characters.is_party?).to eq(true)
      end
    end
  end

  describe "#compile" do
    it "calls #is_party?" do
      allow(@single_character).to receive(:compile_individual) {nil}
      expect(@single_character).to receive(:is_party?)

      @single_character.compile
    end

    context "when #is_party? returns true" do
      it "calls #compile_party" do
        expect(@multiple_characters).to receive(:compile_party)

        @multiple_characters.compile
      end
    end

    context "when #is_party? returns false" do
      it "calls #compile_individual" do
        expect(@single_character).to receive(:compile_individual)

        @single_character.compile
      end
    end
  end

  describe "#setup" do
    context "with any amount of characters in the party" do
      it "initializes 12 CardTypes" do
        expect(PathfinderDeckBuilder::CharacterCard).to receive(:new)
        expect(PathfinderDeckBuilder::MeleeWeaponCard).to receive(:new)
        expect(PathfinderDeckBuilder::RangedWeaponCard).to receive(:new)
        expect(PathfinderDeckBuilder::ArmorCard).to receive(:new)
        expect(PathfinderDeckBuilder::TrackedResourceCard).to receive(:new)
        expect(PathfinderDeckBuilder::SpellCard).to receive(:new)
        expect(PathfinderDeckBuilder::SkillCard).to receive(:new)
        expect(PathfinderDeckBuilder::DefensiveAbilityCard).to receive(:new)
        expect(PathfinderDeckBuilder::FeatCard).to receive(:new)
        expect(TraitCard).to receive(:new)
        expect(PathfinderDeckBuilder::SpecialAbilityCard).to receive(:new)
        expect(PathfinderDeckBuilder::SpecialAttackCard).to receive(:new)
        
        @single_character.setup
      end

      it "initializes a PathfinderDeckBuilder::Deck" do
        expect(PathfinderDeckBuilder::Deck).to receive(:new)

        @single_character.setup
      end
    end
  end

  describe "#read_file_path" do
    it "Loads a XML file into memory using a given file path" do
      expect(@single_character.myXML).to eq(nil)

      @single_character.read_file_path

      expect(@single_character.myXML).to eq(Crack::XML.parse(File.read(@single_character.file_path)))
    end
  end

  describe "#build_cards" do
    it "calls #setup" do
      allow(@single_character.setup_cards).to receive(:each) {nil}
      expect(@single_character).to receive(:setup)

      @single_character.build_cards
    end
  end
end
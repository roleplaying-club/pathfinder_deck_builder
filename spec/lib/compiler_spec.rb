require_relative '../spec_helper.rb'
require_relative '../../lib/compiler.rb'
require 'json'
require 'crack'

describe Compiler do
  before {@single_character = Compiler.new('spec/Aer.xml')}
  before {@multiple_characters = Compiler.new('spec/Fellowship.xml')}

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
        expect_any_instance_of(CharacterCard).to receive(:initialize).and_return(:nil)
        expect_any_instance_of(MeleeWeaponCard).to receive(:initialize).and_return(:nil)
        expect_any_instance_of(RangedWeaponCard).to receive(:initialize).and_return(:nil)
        expect_any_instance_of(ArmorCard).to receive(:initialize).and_return(:nil)
        expect_any_instance_of(TrackedResourceCard).to receive(:initialize).and_return(:nil)
        expect_any_instance_of(SpellCard).to receive(:initialize).and_return(:nil)
        expect_any_instance_of(SkillCard).to receive(:initialize).and_return(:nil)
        expect_any_instance_of(DefensiveAbilityCard).to receive(:initialize).and_return(:nil)
        expect_any_instance_of(FeatCard).to receive(:initialize).and_return(:nil)
        expect_any_instance_of(TraitCard).to receive(:initialize).and_return(:nil)
        expect_any_instance_of(SpecialAbilityCard).to receive(:initialize).and_return(:nil)
        expect_any_instance_of(SpecialAttackCard).to receive(:initialize).and_return(:nil)
        
        @single_character.setup
      end

      it "initializes a Deck" do
        expect_any_instance_of(Deck).to receive(:initialize).and_return(:nil)

        @single_character.setup
      end
    end
  end
end
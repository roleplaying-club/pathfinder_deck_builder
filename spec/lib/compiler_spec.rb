require_relative '../spec_helper.rb'
require_relative '../../lib/compiler.rb'
require 'json'
require 'crack'

describe Compiler do
  before {@single_character = Compiler.new('spec/Aer.xml')}
  before {@multiple_characters = Compiler.new('spec/Fellowship.xml')}
  before {`rm *.json` if Dir.entries(Dir.pwd).include?(/.json/)}
  after {`rm *.json` if Dir.entries(Dir.pwd).include?(/.json/)}

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
end
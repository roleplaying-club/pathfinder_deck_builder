require_relative '../spec_helper.rb'
require_relative '../../lib/deck.rb'
require 'json'

describe Deck do 
  
  before {@deck = Deck.new}
  before {`rm new_deck.json`}

  it "is initialized with an empty array called cards" do
    expect(@deck.cards.class).to eq(Array)
    expect(@deck.cards).to be_empty
  end

  it "#save_deck creates a new file at the provided path" do
    expect{@deck.save_deck}.to change{Dir.entries(Dir.pwd).count}.by(1)
  end
end
class Deck
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def save_deck(to_file="new_deck.json", cards)
    File.open(to_file, "w") do |file|
      file.puts JSON.pretty_generate(cards)
    end
  end
end
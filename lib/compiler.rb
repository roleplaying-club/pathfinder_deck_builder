require "pry"
require "crack"
require "json"
require_relative 'card_creator'
require_relative 'deck'

class Compiler
  def initialize(file_path)
    @file_path = file_path
  end
  
  def compile
    deck = Deck.new
    creator = CardCreator.new
    myXML = Crack::XML.parse(File.read(@file_path))

    deck.cards << creator.create_character_card(myXML)

    creator.create_weapon_card(myXML, "melee") if myXML["document"]["public"]["character"]["melee"] != nil
    creator.create_weapon_card(myXML, "ranged") if myXML["document"]["public"]["character"]["ranged"] != nil
    creator.create_armor_card(myXML) if myXML["document"]["public"]["character"]["defenses"]["armor"] != nil

    creator.weapons.each do |w|
      deck.cards << w
    end

    creator.armors.each do |a|
      deck.cards << a
    end

    deck.save_deck("#{@file_path.split(".")[0]}"+".json", deck.cards)

    puts "Please check your current directory for a JSON file with your deck name."
  end
end
require 'crack'
require 'json'
require_relative 'character_card'
require_relative 'melee_weapon_card'
require_relative 'ranged_weapon_card'
require_relative 'armor_card'
require_relative 'tracked_resource_card'
require_relative 'spell_card'
require_relative 'skill_card'
require_relative 'defensive_ability_card'
require_relative 'feat_card'
require_relative 'trait_card'
require_relative 'special_ability_card'
require_relative 'special_attack_card'
require_relative 'deck'

class Compiler
  def initialize(file_path)
    @file_path = file_path
  end
  
  def is_party?
    Crack::XML.parse(File.read(@file_path))["document"]["public"]["character"].class == Array
  end

  def compile_individual
    @myXML = Crack::XML.parse(File.read(@file_path))
    setup


    @setup_cards.each { |card| card.create_card }
    
    @setup_cards.each do |card|
      card.create_card
    end

    @setup_cards.each do |card|
      card.class_cards.each {|class_card| @deck.cards << class_card}
    end

    @deck.save_deck("#{@file_path.split(".")[0]}"+".json")

    puts "Please check your current directory for a JSON file with your deck name."
  end

  def compile_party
    @myXML = Crack::XML.parse(File.read(@file_path))
    @myXML["document"]["public"]["character"].each_with_index do |fun_stuff, index|
      setup

      @setup_cards.each { |card| card.create_card(index) }

      @setup_cards.each do |card|
        card.create_card(index)
      end

      @setup_cards.each do |card|
        card.class_cards.each {|class_card| @deck.cards << class_card}
      end

      @deck.save_deck("#{fun_stuff["name"]}"+".json")

      puts "Please check your current directory for a JSON file with your deck name."
    end
  end

  def setup
    @deck = Deck.new
    @setup_cards = [
      @character = CharacterCard.new(@myXML),
      @melee_weapons = MeleeWeaponCard.new(@myXML),
      @ranged_weapons = RangedWeaponCard.new(@myXML),
      @armors = ArmorCard.new(@myXML),
      @tracked_resources = TrackedResourceCard.new(@myXML),
      @spells = SpellCard.new(@myXML),
      @skills = SkillCard.new(@myXML),
      @defenses = DefensiveAbilityCard.new(@myXML),
      @feats = FeatCard.new(@myXML),
      @traits = TraitCard.new(@myXML),
      @special_abilities = SpecialAbilityCard.new(@myXML),
      @special_attacks = SpecialAttackCard.new(@myXML)
    ]
  end

  def compile
    if self.is_party?
      compile_party
    else
      compile_individual
    end
  end
end
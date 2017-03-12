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

module PathfinderDeckBuilder
  class Compiler
    attr_accessor :deck
    attr_reader :setup_cards, :file_path, :myXML

    def initialize(file_path)
      @file_path = file_path
    end
    
    def is_party?
      Crack::XML.parse(File.read(@file_path))["document"]["public"]["character"].class == Array
    end

    def compile_individual
      read_file_path

      build_cards

      save_deck("#{@deck.cards.first[:title]}"+".json")
    end

    def compile_party
      read_file_path
      @myXML["document"]["public"]["character"].each_with_index do |character, index|

        build_cards(index)

        save_deck("#{character["name"]}"+".json")
      end
    end

    def prepare_for_s3
      read_file_path
      
      build_cards

      return @deck.cards
    end

    def setup
      @deck = PathfinderDeckBuilder::Deck.new
      @setup_cards = [
        @character = PathfinderDeckBuilder::CharacterCard.new(@myXML),
        @melee_weapons = PathfinderDeckBuilder::MeleeWeaponCard.new(@myXML),
        @ranged_weapons = RangedWeaponCard.new(@myXML),
        @armors = PathfinderDeckBuilder::ArmorCard.new(@myXML),
        @tracked_resources = TrackedResourceCard.new(@myXML),
        @spells = SpellCard.new(@myXML),
        @skills = SkillCard.new(@myXML),
        @defenses = PathfinderDeckBuilder::DefensiveAbilityCard.new(@myXML),
        @feats = PathfinderDeckBuilder::FeatCard.new(@myXML),
        @traits = TraitCard.new(@myXML),
        @special_abilities = SpecialAbilityCard.new(@myXML),
        @special_attacks = SpecialAttackCard.new(@myXML)
      ]
    end

    def compile
      if is_party?
        compile_party
      else
        compile_individual
      end
    end

    def save_deck(file_name)
      @deck.save_deck(file_name)
      puts "Please check your current directory for a JSON file with your deck name."
    end

    def build_cards(index=nil)
      setup

      @setup_cards.each { |card| card.create_card(index) }

      @setup_cards.each do |card|
        card.class_cards.each {|class_card| @deck.cards << class_card}
      end
    end

    def read_file_path
      @myXML = Crack::XML.parse(File.read(@file_path))
    end
  end
end
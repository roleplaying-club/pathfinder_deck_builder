require 'crack'
require 'json'
require_relative 'character_card'
require_relative 'weapon_card'
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

    @character.create_card
    @weapons.create_card(@myXML, "melee") if @myXML["document"]["public"]["character"]["melee"] != nil
    @armors.create_card
    @weapons.create_card(@myXML, "ranged") if @myXML["document"]["public"]["character"]["ranged"] != nil
    @tracked_resources.create_card(@myXML) if @myXML["document"]["public"]["character"]["trackedresources"] != nil
    @spells.create_card(@myXML) if @myXML["document"]["public"]["character"]["spellsmemorized"] != nil
    @skills.create_card
    @defenses.create_card
    @feats.create_card
    @traits.create_card(@myXML) if @myXML["document"]["public"]["character"]["traits"] != nil
    @special_abilities.create_card(@myXML) if @myXML ["document"]["public"]["character"]["otherspecials"]["special"] != nil
    @special_attacks.create_card(@myXML) if @myXML["document"]["public"]["character"]["attack"]["special"] != nil

    #turn lines 29-40 into something like lines 44-46

    #@setup_cards.each do |card|
    #  card.create_card
    #end

    @setup_cards.each do |card|
      card.class_cards.each {|class_card| @deck.cards << class_card}
    end

    @deck.save_deck("#{@file_path.split(".")[0]}"+".json", @deck.cards)

    puts "Please check your current directory for a JSON file with your deck name."
  end

  def compile_party
    @myXML = Crack::XML.parse(File.read(@file_path))
    @myXML["document"]["public"]["character"].each_with_index do |fun_stuff, index|
      setup

      @character.create_card(index)
      @weapons.create_card(@myXML, "melee", index) if @myXML["document"]["public"]["character"][index]["melee"] != nil
      @armors.create_card(index)
      @weapons.create_card(@myXML, "ranged", index) if @myXML["document"]["public"]["character"][index]["ranged"] != nil
      @tracked_resources.create_card(@myXML, index) if @myXML["document"]["public"]["character"][index]["trackedresources"] != nil
      @spells.create_card(@myXML, index) if @myXML["document"]["public"]["character"][index]["spellsmemorized"] != nil
      @skills.create_card(index)
      @defenses.create_card(index)
      @feats.create_card(index)
      @traits.create_card(@myXML, index) if @myXML["document"]["public"]["character"][index]["traits"] != nil
      @special_abilities.create_card(@myXML, index) if @myXML ["document"]["public"]["character"][index]["otherspecials"]["special"] != nil
      @special_attacks.create_card(@myXML, index) if @myXML["document"]["public"]["character"][index]["attack"]["special"] != nil

      @setup_cards.each do |card|
        card.class_cards.each {|class_card| @deck.cards << class_card}
      end

      @deck.save_deck("#{fun_stuff["name"]}"+".json", @deck.cards)

      puts "Please check your current directory for a JSON file with your deck name."
    end
  end

  def setup
    @deck = Deck.new
    @setup_cards = [
      @character = CharacterCard.new(@myXML),
      @weapons = WeaponCard.new,
      @armors = ArmorCard.new(@myXML),
      @tracked_resources = TrackedResourceCard.new,
      @spells = SpellCard.new,
      @skills = SkillCard.new(@myXML),
      @defenses = DefensiveAbilityCard.new(@myXML),
      @feats = FeatCard.new(@myXML),
      @traits = TraitCard.new,
      @special_abilities = SpecialAbilityCard.new,
      @special_attacks = SpecialAttackCard.new
    ]
  end
end
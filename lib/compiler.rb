require "pry"
require "crack"
require "json"
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
  
  def compile
    deck = Deck.new
    character = CharacterCard.new
    weapons = WeaponCard.new
    armors = ArmorCard.new
    tracked_resources = TrackedResourceCard.new
    spells = SpellCard.new
    skills = SkillCard.new
    defenses = DefensiveAbilityCard.new
    feats = FeatCard.new
    traits = TraitCard.new
    special_abilities = SpecialAbilityCard.new
    special_attacks = SpecialAttackCard.new
    myXML = Crack::XML.parse(File.read(@file_path))

    deck.cards << character.create_card(myXML)

    weapons.create_card(myXML, "melee") if myXML["document"]["public"]["character"]["melee"] != nil
    armors.create_card(myXML) if myXML["document"]["public"]["character"]["defenses"]["armor"] != nil
    weapons.create_card(myXML, "ranged") if myXML["document"]["public"]["character"]["ranged"] != nil
    tracked_resources.create_card(myXML) if myXML["document"]["public"]["character"]["trackedresources"] != nil
    spells.create_card(myXML) if myXML["document"]["public"]["character"]["spellsmemorized"] != nil
    skills.create_card(myXML) if myXML["document"]["public"]["character"]["skills"] != nil
    defenses.create_card(myXML) if myXML["document"]["public"]["character"]["defensive"] != nil
    feats.create_card(myXML) if myXML["document"]["public"]["character"]["feats"]["feat"] != nil
    traits.create_card(myXML) if myXML["document"]["public"]["character"]["traits"]["trait"] != nil
    special_abilities.create_card(myXML) if myXML ["document"]["public"]["character"]["otherspecials"]["special"] != nil
    special_attacks.create_card(myXML) if myXML["document"]["public"]["character"]["attack"]["special"] != nil

    weapons.class_cards.each do |wc|
      deck.cards << wc
    end

    armors.class_cards.each do |ac|
      deck.cards << ac
    end

    tracked_resources.class_cards.each do |trc|
      deck.cards << trc
    end

    spells.class_cards.each do |sc|
      deck.cards << sc
    end

    skills.class_cards.each do |sc|
      deck.cards << sc
    end

    defenses.class_cards.each do |sc|
      deck.cards << sc
    end

    feats.class_cards.each do |fc|
      deck.cards << fc
    end

    traits.class_cards.each do |tc|
      deck.cards << tc
    end

    special_abilities.class_cards.each do |sac|
      deck.cards << sac
    end

    special_attacks.class_cards.each do |sac|
      deck.cards << sac
    end

    deck.save_deck("#{@file_path.split(".")[0]}"+".json", deck.cards)

    puts "Please check your current directory for a JSON file with your deck name."
  end
end
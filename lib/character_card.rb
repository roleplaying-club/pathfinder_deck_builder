require_relative 'card'
class CharacterCard < Card

  def initialize(xml_file)
    super
  end

  def create_card(index=nil)
    super
    @class_cards.push(assembled_card)
  end

  def assembled_card
    {
      "count" => 1,
      "color": "blue",
      "title": "#{@character_path["name"]}",
      "icon": nil,
      "contents": [
        "subtitle | Character Info",
        "property | Base HP | #{@character_path["health"]["hitpoints"]}",
        "property | Race | #{@character_path["race"]["name"].capitalize}",
        "property | Ethnicity | #{@character_path["race"]["ethnicity"].capitalize}",
        "section | Combat",
        "property | AC | #{@ac_path["ac"]}",
        "property | Touch AC | #{@character_path["armorclass"]["touch"]}",
        "property | Flat-Footed AC | #{@character_path["armorclass"]["flatfooted"]}",
        "property | Attack Bonus | #{@attack_path["attackbonus"]}",
        "property | Initiative | #{@character_path["initiative"]["total"]}",
        "property | Movement | #{@character_path["movement"]["basespeed"]["text"]}",
        "fill",
        "rule",
        "dndstats | #{@attribute_path[0]["attrvalue"]["base"]} | #{@attribute_path[1]["attrvalue"]["base"]} | #{@attribute_path[2]["attrvalue"]["base"]} | #{@attribute_path[3]["attrvalue"]["base"]} | #{@attribute_path[4]["attrvalue"]["base"]} | #{@attribute_path[5]["attrvalue"]["base"]}"
      ]
    }
  end
end
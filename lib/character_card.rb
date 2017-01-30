class CharacterCard
  attr_accessor :class_cards

  def initialize
    @class_cards = []
  end

  def create_card(xml_file, index=nil)
    @xml_file = xml_file
    @index = index
    set_path

    @class_cards.push(
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
    )
  end

  def set_path
    @character_path = @index.nil? ? @xml_file["document"]["public"]["character"] : @xml_file["document"]["public"]["character"][@index]
    @ac_path = @index.nil? ? @xml_file["document"]["public"]["character"]["armorclass"] : @xml_file["document"]["public"]["character"][@index]["armorclass"]
    @initiative_path = @index.nil? ? @xml_file["document"]["public"]["character"]["initiative"] : @xml_file["document"]["public"]["character"][@index]["armorclass"]
    @movement_path = @index.nil? ? @xml_file["document"]["public"]["character"]["movement"] : @xml_file["document"]["public"]["character"][@index]["movement"]
    @attack_path = @index.nil? ? @xml_file["document"]["public"]["character"]["attack"] : @xml_file["document"]["public"]["character"][@index]["attack"]
    @attribute_path = @index.nil? ? @xml_file["document"]["public"]["character"]["attributes"]["attribute"] : @xml_file["document"]["public"]["character"][@index]["attributes"]["attribute"]
  end
end
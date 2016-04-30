class CharacterCard
  attr_accessor :class_cards

  def initialize
    @class_cards = []
  end

  def create_card(xml_file, index=nil)
    @index = index
    if index == nil
      character_path = xml_file["document"]["public"]["character"]
      ac_path = xml_file["document"]["public"]["character"]["armorclass"]
      initiative_path = xml_file["document"]["public"]["character"]["initiative"]
      movement_path = xml_file["document"]["public"]["character"]["movement"]
      attack_path = xml_file["document"]["public"]["character"]["attack"]
      attribute_path = xml_file["document"]["public"]["character"]["attributes"]["attribute"]
    else
      character_path = xml_file["document"]["public"]["character"][index]
      ac_path = xml_file["document"]["public"]["character"][index]["armorclass"]
      initiative_path = xml_file["document"]["public"]["character"][index]["initiative"]
      movement_path = xml_file["document"]["public"]["character"][index]["movement"]
      attack_path = xml_file["document"]["public"]["character"][index]["attack"]
      attribute_path = xml_file["document"]["public"]["character"][index]["attributes"]["attribute"]
    end

    {
      "count" => 1,
      "color": "blue",
      "title": "#{character_path["name"]}",
      "icon": nil,
      "contents": [
        "subtitle | Character Info",
        "property | Base HP | #{character_path["health"]["hitpoints"]}",
        "property | Race | #{character_path["race"]["name"].capitalize}",
        "property | Ethnicity | #{character_path["race"]["ethnicity"].capitalize}",
        "section | Combat",
        "property | AC | #{ac_path["ac"]}",
        "property | Touch AC | #{character_path["armorclass"]["touch"]}",
        "property | Flat-Footed AC | #{character_path["armorclass"]["flatfooted"]}",
        "property | Attack Bonus | #{attack_path["attackbonus"]}",
        "property | Initiative | #{character_path["initiative"]["total"]}",
        "property | Movement | #{character_path["movement"]["basespeed"]["text"]}",
        "fill",
        "rule",
        "dndstats | #{attribute_path[0]["attrvalue"]["base"]} | #{attribute_path[1]["attrvalue"]["base"]} | #{attribute_path[2]["attrvalue"]["base"]} | #{attribute_path[3]["attrvalue"]["base"]} | #{attribute_path[4]["attrvalue"]["base"]} | #{attribute_path[5]["attrvalue"]["base"]}"
      ]
    }
  end
end
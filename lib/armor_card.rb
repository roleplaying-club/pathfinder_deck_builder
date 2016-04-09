require_relative 'character_card'

class ArmorCard < CharacterCard

def create_armor_card(xml_file)
    xml_file["document"]["public"]["character"]["defenses"]["armor"].each do |armor|
      @class_cards << {
        "count": 1,
        "color": "grey",
        "title": "#{armor["name"]}",
        "icon": nil,
        "contents": [
          "property | AC | #{armor["ac"]}",
          "property | Weight | #{armor["weight"]["text"]}",
          "property | Cost | #{armor["cost"]["text"]}",
          "property | Quantity | #{armor["quantity"]}",
          "property | Description | #{armor["description"]}"
        ]
      }
    end
  end
end
require_relative 'character_card'

class ArmorCard < CharacterCard

  def create_card(xml_file)
    if xml_file["document"]["public"]["character"]["defenses"]["armor"].class == Hash
      @class_cards << {
        "count": 1,
        "color": "grey",
          "title": "#{xml_file["document"]["public"]["character"]["defenses"]["armor"]["name"]}",
          "icon": nil,
          "contents": [
          "property | AC | #{xml_file["document"]["public"]["character"]["defenses"]["armor"]["ac"]}",
          "property | Weight | #{xml_file["document"]["public"]["character"]["defenses"]["armor"]["weight"]["text"]}",
          "property | Cost | #{xml_file["document"]["public"]["character"]["defenses"]["armor"]["cost"]["text"]}",
          "property | Quantity | #{xml_file["document"]["public"]["character"]["defenses"]["armor"]["quantity"]}",
          "property | Description | #{xml_file["document"]["public"]["character"]["defenses"]["armor"]["description"]}"
        ]
      }
    elsif xml_file["document"]["public"]["character"]["defenses"]["armor"].class == Array
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
end

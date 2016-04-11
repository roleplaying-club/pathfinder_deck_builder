require_relative 'character_card'

class ArmorCard < CharacterCard

  def create_card(xml_file)
    path = xml_file["document"]["public"]["character"]["defenses"]["armor"]

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "grey",
          "title": "Armor",
          "icon": nil,
          "contents": [
          "subtitle | #{path["name"]}",
          "rule",
          "property | AC | #{path["ac"]}",
          "property | Weight | #{path["weight"]["text"]}",
          "property | Cost | #{path["cost"]["text"]}",
          "property | Quantity | #{path["quantity"]}",
          "fill",
          "section | Description",
          "text | #{path["description"]}"[0..500]
        ]
      }
    elsif path.class == Array
      path.each do |armor|
        @class_cards << {
          "count": 1,
          "color": "grey",
          "title": "Armor",
          "icon": nil,
          "contents": [
            "subtitle | #{armor["name"]}",
            "rule",
            "property | AC | #{armor["ac"]}",
            "property | Weight | #{armor["weight"]["text"]}",
            "property | Cost | #{armor["cost"]["text"]}",
            "property | Quantity | #{armor["quantity"]}",
            "fill",
            "section | Description",
            "text | #{armor["description"]}"[0..500]
          ]
        }
      end
    end
  end
end

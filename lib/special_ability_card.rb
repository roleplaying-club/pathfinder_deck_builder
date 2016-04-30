require_relative 'character_card'

class SpecialAbilityCard < CharacterCard

  def create_card(xml_file, index=nil)
    if index == nil
      path = xml_file["document"]["public"]["character"]["otherspecials"]["special"]
    else
      path = xml_file["document"]["public"]["character"][index]["otherspecials"]["special"]
    end

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Special Ability",
          "icon": nil,
          "contents": [
          "subtitle | #{path["shortname"]}",
          "section | Description",
          "text | #{path["description"]}"[0..600],
        ]
      }
    elsif path.class == Array
      path.each do |sa|
        @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Special Ability",
          "icon": nil,
          "contents": [
          "subtitle | #{sa["name"]}",
          "fill",
          "section | Description",
          "text | #{sa["description"]}"[0..600],
        ]
      }
      end
    end
  end
end

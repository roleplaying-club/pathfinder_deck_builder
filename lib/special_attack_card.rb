require_relative 'character_card'

class SpecialAttackCard < CharacterCard

  def create_card(xml_file)
    path = xml_file["document"]["public"]["character"]["attack"]["special"]

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Special Attack",
          "icon": nil,
          "contents": [
          "subtitle | #{path["shortname"]}",
          "rule",
          "property | Type | #{path["type"]}",
          "fill",
          "section | Description",
          "text | #{path["description"]}"[0..318]
        ]
      }
    elsif path.class == Array
      path.each do |sa|
        @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Special Attack",
          "icon": nil,
          "contents": [
          "subtitle | #{sa["shortname"]}",
          "rule",
          "property | Type | #{sa["type"]}",
          "fill",
          "section | Description",
          "text | #{sa["description"]}"[0..318]
        ]
      }
      end
    end
  end
end

require_relative 'card'

class SpecialAbilityCard < Card

  def create_card(xml_file, index=nil)
    @index = index
    if index == nil
      path = xml_file["document"]["public"]["character"]["otherspecials"]["special"]
    else
      path = xml_file["document"]["public"]["character"][@index]["otherspecials"]["special"]
    end

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Special Ability",
          "icon": "magic-swirl",
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
          "icon": "magic-swirl",
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

require_relative 'card'

class SpecialAttackCard < Card

  def create_card(xml_file, index=nil)
    @index = index
    if index == nil
      path = xml_file["document"]["public"]["character"]["attack"]["special"]
    else
      path = xml_file["document"]["public"]["character"][@index]["attack"]["special"]
    end

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Special Attack",
          "icon": "wyvern",
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
          "icon": "wyvern",
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

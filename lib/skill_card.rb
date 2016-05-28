require_relative 'character_card'

class SkillCard < CharacterCard

  def create_card(xml_file, index=nil)
    @index = index
    if index == nil
      path = xml_file["document"]["public"]["character"]["skills"]["skill"]
    else
      path = xml_file["document"]["public"]["character"][@index]["skills"]["skill"]
    end

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "orange",
          "title": "Skill",
          "icon": "gears",
          "contents": [
          "subtitle | #{path[name]}",
          "rule",
          "property | Value | #{path["value"]}",
          "property | Ranks | #{path["ranks"]}",
          "property | #{path["attrname"]} Bonus: | #{path["attrname"]} #{path["attrbonus"]}",
          "section | Description",
          "text | #{path["description"]}"[0..500]
        ]
      }
    elsif path.class == Array
      path.each do |sc|
        @class_cards << {
        "count": 1,
        "color": "orange",
          "title": "Skill",
          "icon": "gears",
          "contents": [
          "subtitle | #{sc["name"]}",
          "rule",
          "property | Value | #{sc["value"]}",
          "property | Ranks | #{sc["ranks"]}",
          "property | #{sc["attrname"]} Bonus: | #{sc["attrbonus"]}",
          "section | Description",
          "text | #{sc["description"]}"[0..500]
        ]
      }
      end
    end
  end
end

require_relative 'character_card'

class SkillCard < CharacterCard

  def create_card(xml_file)
    path = xml_file["document"]["public"]["character"]["skills"]["skill"]

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "orange",
          "title": "#{path[name]}",
          "icon": nil,
          "contents": [
          "property | Value | #{path["value"]}",
          "property | Ranks | #{path["ranks"]}",
          "property | Bonus | #{path["attrname"]}: #{path["attrbonus"]}",
          "property | Situational Modifiers | #{path["situationalmodifiers"]["situationalmodifier"]["text"]}",
          "property | Description | #{path["description"]}"[0..300]
        ]
      }
    elsif path.class == Array
      path.each do |sc|
        @class_cards << {
        "count": 1,
        "color": "orange",
          "title": "#{sc["name"]}",
          "icon": nil,
          "contents": [
          "property | Value | #{sc["value"]}",
          "property | Ranks | #{sc["ranks"]}",
          "property | Bonus | #{sc["attrname"]}: #{sc["attrbonus"]}",
          #"property | Situational Modifiers | #{sc["situationalmodifiers"]["situationalmodifier"]["text"]}",
          "property | Description | #{sc["description"]}"[0..300]
        ]
      }
      end
    end
  end
end

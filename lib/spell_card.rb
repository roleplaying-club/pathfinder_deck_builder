require_relative 'character_card'

class SpellCard < CharacterCard

  def create_card(xml_file)
    path = xml_file["document"]["public"]["character"]["spellsmemorized"]["spell"]

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "green",
          "title": path["name"],
          "icon": nil,
          "contents": [
          "property | Class | #{path["class"]}",
          "property | Level | #{path["level"]}",
          "property | Cast Time | #{path["casttime"]}",
          "property | Duration | #{path["duration"]}",
          "property | Range | #{path["range"]}",
          "property | Target | #{path["target"]}",
          "property | Area | #{path["area"]}",
          "property | Description | #{path["description"]}"
        ]
      }
    elsif path.class == Array
      path.each do |s|
        @class_cards << {
        "count": 1,
        "color": "green",
          "title": "#{s["name"]}",
          "icon": nil,
          "contents": [
          "property | Class | #{s["class"]}",
          "property | Level | #{s["level"]}",
          "property | Cast Time | #{s["casttime"]}",
          "property | Duration | #{s["duration"]}",
          "property | Range | #{s["range"]}",
          "property | Target | #{s["target"]}",
          "property | Area | #{s["area"]}",
          "property | Description | #{s["description"]}"
        ]
      }
      end
    end
  end
end

require_relative 'card'

class SpellCard < Card

  def create_card(xml_file, index=nil)
    @index = index
    if index == nil
      path = xml_file["document"]["public"]["character"]["spellsmemorized"]["spell"]
    else
      path = xml_file["document"]["public"]["character"][@index]["spellsmemorized"]["spell"]
    end

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Spell",
          "icon": "white-book-#{path["level"]}",
          "contents": [
          "subtitle | #{path["name"]}",
          "rule",
          "property | Class | #{path["class"]}",
          "property | Level | #{path["level"]}",
          "property | Cast Time | #{path["casttime"]}",
          "property | Duration | #{path["duration"]}",
          "property | Range | #{path["range"]}",
          "property | Target | #{path["target"]}",
          "property | Area | #{path["area"]}",
          "fill",
          "section | Description",
          "text | #{path["description"]}"[0..318]
        ]
      }
    elsif path.class == Array
      path.each do |s|
        @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Spell",
          "icon": "white-book-#{s["level"]}",
          "contents": [
          "subtitle | #{s["name"]}",
          "rule",
          "property | Class | #{s["class"]}",
          "property | Level | #{s["level"]}",
          "property | Cast Time | #{s["casttime"]}",
          "property | Duration | #{s["duration"]}",
          "property | Range | #{s["range"]}",
          "property | Target | #{s["target"]}",
          "property | Area | #{s["area"]}",
          "fill",
          "section | Description",
          "text | #{s["description"]}"[0..318]
        ]
      }
      end
    end
  end
end

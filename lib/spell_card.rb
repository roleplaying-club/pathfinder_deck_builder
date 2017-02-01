require_relative 'card'

class SpellCard < Card

  def create_card(index=nil)
    super
  end

  def set_class_path
    @class_path = @spell_path
  end

  def assembled_card(path)
    super
  end

  def static_content
    {
      "count": 1,
      "color": "green",
      "title": "Spell"
    }
  end

  def variable_content(path)
    {
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
  end
end

require_relative 'card'

class SkillCard < Card

  def create_card(index=nil)
    super
  end

  def set_class_path
    @class_path = @skill_path
  end

  def assembled_card(path)
    super
  end

  def static_content
    {
      "count": 1,
      "color": "orange",
      "title": "Skill",
      "icon": "gears"
    }
  end

  def variable_content(path)
    {
      "contents": [
        "subtitle | #{path["name"]}",
        "rule",
        "property | Value | #{path["value"]}",
        "property | Ranks | #{path["ranks"]}",
        "property | #{path["attrname"]} Bonus: | #{path["attrname"]} #{path["attrbonus"]}",
        "section | Description",
        "text | #{path["description"]}"[0..500]
      ]
    }
  end
end

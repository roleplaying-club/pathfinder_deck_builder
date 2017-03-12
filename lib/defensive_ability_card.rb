require_relative 'card'

class DefensiveAbilityCard < PathfinderDeckBuilder::Card

  def create_card(index=nil)
    super
  end

  def set_class_path
   @class_path = @defensive_ability_path
  end

  def assembled_card(path)
    super
  end

  def static_content
    {
      "count": 1,
      "color": "green",
      "title": "Defensive Ability",
      "icon": "spiked-shell"
    }
  end

  def variable_content(path)
    {
      "contents": [
        "subtitle | #{path["shortname"]}",
        "rule",
        "property | Type | #{path["type"]}",
        "fill",
        "section | Description",
        "text | #{path["description"]}"[0..318]
      ]
    }
  end
end
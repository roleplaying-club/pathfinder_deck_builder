require_relative 'card'
class DefensiveAbilityCard < Card

  def create_card(index=nil)
    super
    unless @defensive_ability_path.nil?

      if @defensive_ability_path.class == Hash
        @class_cards.push(assembled_card(@defensive_ability_path))
      else
        @defensive_ability_path.each { |path| @class_cards.push(assembled_card(path)) }
      end
    end
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
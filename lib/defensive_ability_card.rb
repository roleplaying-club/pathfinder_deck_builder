require_relative 'card'
class DefensiveAbilityCard < Card

  def initalize(xml_file)
    super
  end

  def create_card(index=nil)
    super

    unless @defensive_ability_path.nil?

      if @defensive_ability_path.class == Hash
        @class_cards << {
          "count": 1,
          "color": "green",
            "title": "Defensive Ability",
            "icon": "spiked-shell",
            "contents": [
            "subtitle | #{@defensive_ability_path["shortname"]}",
            "rule",
            "property | Type | #{@defensive_ability_path["type"]}",
            "section | Description",
            "text | #{@defensive_ability_path["description"]}"[0..318]
          ]
        }
      elsif @defensive_ability_path.class == Array
        @defensive_ability_path.each do |da|
          @class_cards << {
          "count": 1,
          "color": "green",
            "title": "Defensive Ability",
            "icon": "spiked-shell",
            "contents": [
            "subtitle | #{da["shortname"]}",
            "rule",
            "property | Type | #{da["type"]}",
            "fill",
            "section | Description",
            "text | #{da["description"]}"[0..318]
          ]
        }
        end
      end
    end
  end
end
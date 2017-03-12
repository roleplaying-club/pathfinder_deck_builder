require_relative 'card'

module PathfinderDeckBuilder
  class SpecialAbilityCard < PathfinderDeckBuilder::Card

    def create_card(index=nil)
      super
    end

    def set_class_path
      @class_path = @special_ability_path
    end

    def assembled_card(path)
      super
    end

    def static_content
      {
        "count": 1,
        "color": "green",
        "title": "Special Ability",
        "icon": "magic-swirl"
      }    
    end

    def variable_content(path)
      {
        "contents": [
          "subtitle | #{path["shortname"]}",
          "section | Description",
          "text | #{path["description"]}"[0..600]
        ]
      }
    end
  end
end
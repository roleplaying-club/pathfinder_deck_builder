require_relative 'card'

module PathfinderDeckBuilder
  class RangedWeaponCard < PathfinderDeckBuilder::Card

    def create_card(index=nil)
      super
    end

    def set_class_path
      @class_path = @ranged_weapons_path
    end

    def assembled_card(path)
      super
    end

    def static_content
      {
        "count": 1,
        "color": "green",
        "title": "Ranged Weapon",
        "icon": "bowman"
      }
    end

    def variable_content(path)
      {
        "contents": [
          "subtitle | #{path["name"].capitalize}",
          "property | Damage Type | #{path["ranged"]}",
          "property | Attack | #{path["attack"]}",
          "property | Crit | #{path["crit"]}",
          "fill",
          "section | Description",
          "text | #{path["description"]}"[0..498]
        ]
      }
    end
  end
end
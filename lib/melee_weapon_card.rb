require_relative 'card'

class MeleeWeaponCard < Card

  def create_card(index=nil)
    super
  end

  def set_class_path
    @class_path = @melee_weapon_path
  end

  def assembled_card(path)
    super
  end

  def static_content
    {
      "count": 1,
      "color": "red",
      "title": "Melee Weapon",
      "icon": "battle-axe"
    }
  end

  def variable_content(path)
    {
      "contents": [
        "subtitle | #{path["name"].capitalize}",
        "property | Damage Type | #{path["weptype"]}",
        "property | Attack | #{path["attack"]}",
        "property | Crit | #{path["crit"]}",
        "fill",
        "section | Description",
        "text | #{path["description"]}"[0..498]
      ]
    }
  end
end
require_relative 'character_card'

class WeaponCard < CharacterCard

  def create_card(xml_file, weapon_type)
    path = xml_file["document"]["public"]["character"][weapon_type]["weapon"]

    if path.class == Hash
      @class_cards << {
          "count": 1,
          "color": "red",
          "title": "Weapon",
          "icon": nil,
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
    elsif path.class == Array
      path.each do |w|
        @class_cards << {
          "count": 1,
          "color": "red",
          "title": "Weapon",
          "icon": nil,
          "contents": [
            "subtitle | #{w["name"].capitalize}",
            "property |  Damage Type | #{w["weptype"]}",
            "property | Attack | #{w["attack"]}",
            "property | Crit | #{w["crit"]}",
            "fill",
            "section | Description",
            "text | #{w["description"]}"[0..498]
          ]
        }
      end
    end
  end
end

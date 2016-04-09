require_relative 'character_card'

class WeaponCard < CharacterCard

  def create_card(xml_file, weapon_type)
    if xml_file["document"]["public"]["character"][weapon_type]["weapon"].class == Hash
      @class_cards << {
          "count": 1,
          "color": "red",
          "title": "#{xml_file["document"]["public"]["character"][weapon_type]["weapon"]["name"]}",
          "icon": nil,
          "contents": [
            "subtitle | Damage Type | #{xml_file["document"]["public"]["character"][weapon_type]["weapon"]["weptype"]}",
            "property | Attack | #{xml_file["document"]["public"]["character"][weapon_type]["weapon"]["attack"]}",
            "property | Crit | #{xml_file["document"]["public"]["character"][weapon_type]["weapon"]["crit"]}",
            "property | Description | #{xml_file["document"]["public"]["character"][weapon_type]["weapon"]["description"]}"[0..498]
          ]
        }
    elsif xml_file["document"]["public"]["character"][weapon_type]["weapon"].class == Array
      xml_file["document"]["public"]["character"][weapon_type]["weapon"].each do |w|
        @class_cards << {
          "count": 1,
          "color": "red",
          "title": "#{w["name"]}",
          "icon": nil,
          "contents": [
            "subtitle | Damage Type | #{w["weptype"]}",
            "property | Attack | #{w["attack"]}",
            "property | Crit | #{w["crit"]}",
            "property | Description | #{w["description"]}"[0..498]
          ]
        }
      end
    end
  end
end

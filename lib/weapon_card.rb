require_relative 'character_card'

class WeaponCard < CharacterCard

  def create_card(xml_file, weapon_type)
    begin
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
    rescue => e
      puts "Something went wrong building your #{weapon_type} weapon cards." 
      puts "#{e.message}"
      puts "Help make this app better with a PR."
    end
  end
end
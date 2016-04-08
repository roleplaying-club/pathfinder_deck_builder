class CardCreator
  attr_accessor :weapons, :items, :armors

  def initialize
    @weapons = []
    @items = []
    @armors = []
  end

  def create_character_card(xml_file)
    {
      "count": 1,
      "color": "blue",
      "title": "#{xml_file["document"]["public"]["character"]["name"]}",
      "icon": nil,
      "contents": [
        "subtitle | Character Info",
        "property | Base HP | #{xml_file["document"]["public"]["character"]["health"]["hitpoints"]}",
        "property | Race | #{xml_file["document"]["public"]["character"]["race"]["name"].capitalize}",
        "property | Ethnicity | #{xml_file["document"]["public"]["character"]["race"]["ethnicity"].capitalize}"
      ]
    }
  end

  def create_weapon_card(xml_file, weapon_type)
    begin
      xml_file["document"]["public"]["character"][weapon_type]["weapon"].each do |w|
      @weapons << {
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

  def create_armor_card(xml_file)
    xml_file["document"]["public"]["character"]["defenses"]["armor"].each do |armor|
      @armors << {
        "count": 1,
        "color": "grey",
        "title": "#{armor["name"]}",
        "icon": nil,
        "contents": [
          "property | AC | #{armor["ac"]}",
          "property | Weight | #{armor["weight"]["text"]}",
          "property | Cost | #{armor["cost"]["text"]}",
          "property | Quantity | #{armor["quantity"]}",
          "property | Description | #{armor["description"]}"
        ]
      }
    end
  end
end
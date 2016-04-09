class CharacterCard
  attr_accessor :class_cards

  def initialize
    @class_cards = []
  end

  def create_card(xml_file)
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
end
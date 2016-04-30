require_relative 'character_card'

class TraitCard < CharacterCard

  def create_card(xml_file, index=nil)
    if index == nil
      path = xml_file["document"]["public"]["character"]["traits"]["trait"]
    else
      path = xml_file["document"]["public"]["character"][index]["traits"]["trait"]
    end

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Trait",
          "icon": "usable",
          "contents": [
          "subtitle | #{path["name"]}",
          "rule",
          "property | Category | #{path["categorytext"]}",
          "section | Description",
          "text | #{path["description"]}"[0..318]
        ]
      }
    elsif path.class == Array
      path.each do |t|
        @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Trait",
          "icon": "usable",
          "contents": [
          "subtitle | #{t["name"]}",
          "rule",
          "property | Category | #{t["categorytext"]}",
          "fill",
          "section | Description",
          "text | #{t["description"]}"[0..318]
        ]
      }
      end
    end
  end
end

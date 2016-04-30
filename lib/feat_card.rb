require_relative 'character_card'

class FeatCard < CharacterCard

  def create_card(xml_file, index=nil)
    if index == nil
      path = xml_file["document"]["public"]["character"]["feats"]["feat"]
    else
      path = xml_file["document"]["public"]["character"][index]["feats"]["feat"]
    end

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Feat",
          "icon": "foot-trip",
          "contents": [
          "subtitle | #{path["name"]}",
          "rule",
          "property | Category | #{path["categorytext"]}",
          "section | Description",
          "text | #{path["description"]}"[0..318]
        ]
      }
    elsif path.class == Array
      path.each do |f|
        @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Feat",
          "icon": "foot-trip",
          "contents": [
          "subtitle | #{f["name"]}",
          "rule",
          "property | Category | #{f["categorytext"]}",
          "fill",
          "section | Description",
          "text | #{f["description"]}"[0..318]
        ]
      }
      end
    end
  end
end

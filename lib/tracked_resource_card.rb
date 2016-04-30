require_relative 'character_card'

class TrackedResourceCard < CharacterCard

  def create_card(xml_file, index=nil)
    if index == nil
      path = xml_file["document"]["public"]["character"]["trackedresources"]["trackedresource"]
    else
      path = xml_file["document"]["public"]["character"][index]["trackedresources"]["trackedresource"]
    end

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "purple",
          "title": "Tracked Resource",
          "icon": "checkbox-tree",
          "contents": [
          "text | #{path["name"]}",
          "fill",
          "section | Charges",
          "boxes | #{path["max"]} | 2.5"
        ]
      }
    elsif path.class == Array
      path.each do |tr|
        @class_cards << {
        "count": 1,
        "color": "purple",
          "title": "Tracked Resource",
          "icon": "checkbox-tree",
          "contents": [
          "text | #{tr["name"]}",
          "fill",
          "section | Charges",
          "boxes | #{tr["max"]} | 2.5"
        ]
      }
      end
    end
  end
end
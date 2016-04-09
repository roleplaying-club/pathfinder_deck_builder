require_relative 'character_card'

class TrackedResourceCard < CharacterCard

  def create_card(xml_file)
    path = xml_file["document"]["public"]["character"]["trackedresources"]["trackedresource"]

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "purple",
          "title": "Tracked Resource",
          "icon": nil,
          "contents": [
          "property | Description | #{path["name"]}",
          "property | Charges | #{path["max"]}",
        ]
      }
    elsif path.class == Array
      path.each do |tr|
        @class_cards << {
        "count": 1,
        "color": "purple",
          "title": "#{tr["name"]}"[0..49],
          "icon": nil,
          "contents": [
          "property | Description | #{tr["name"]}",
          "section | Charges",
          "boxes | #{tr["max"]} | 2.5"
        ]
      }
      end
    end
  end
end

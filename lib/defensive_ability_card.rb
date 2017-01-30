require_relative 'card'

class DefensiveAbilityCard < Card

  def create_card(xml_file, index=nil)
    @index = index
    if index == nil
      path = xml_file["document"]["public"]["character"]["defensive"]["special"]
    else
      path = xml_file["document"]["public"]["character"][@index]["defensive"]["special"]
    end

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Defensive Ability",
          "icon": "spiked-shell",
          "contents": [
          "subtitle | #{path["shortname"]}",
          "rule",
          "property | Type | #{path["type"]}",
          "section | Description",
          "text | #{path["description"]}"[0..318]
        ]
      }
    elsif path.class == Array
      path.each do |da|
        @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Defensive Ability",
          "icon": "spiked-shell",
          "contents": [
          "subtitle | #{da["shortname"]}",
          "rule",
          "property | Type | #{da["type"]}",
          "fill",
          "section | Description",
          "text | #{da["description"]}"[0..318]
        ]
      }
      end
    end
  end
end
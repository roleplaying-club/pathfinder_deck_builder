require_relative 'card'

class FeatCard < Card

  def create_card(index=nil)
    super
    unless @feat_path.nil?

      if @feat_path.class == Hash
        @class_cards.push(assembled_card(@feat_path))
      else
        @feat_path.each { |path| @class_cards.push(assembled_card(path)) }
      end
    end
  end

  def assembled_card(path)
    super
  end

  def static_content
    {
      "count": 1,
      "color": "green",
      "title": "Feat",
      "icon": "foot-trip" 
    }
  end

  def variable_content(path)
    {
      "contents": [
        "subtitle | #{path["name"]}",
        "rule",
        "property | Category | #{path["categorytext"]}",
        "section | Description",
        "text | #{path["description"]}"[0..318]
      ]
    }
  end
end
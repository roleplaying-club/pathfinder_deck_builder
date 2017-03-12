require_relative 'card'

class TraitCard < PathfinderDeckBuilder::Card

  def create_card(index=nil)
    super
  end

  def set_class_path
    @class_path = @trait_path
  end

  def assembled_card(path)
    super
  end

  def static_content
    {
      "count": 1,
      "color": "green",
      "title": "Trait",
      "icon": "usable"
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

require_relative 'card'

class TrackedResourceCard < PathfinderDeckBuilder::Card

  def create_card(index=nil)
    super
  end

  def set_class_path
    @class_path = @tracked_resource_path
  end

  def assembled_card(path)
    super
  end

  def static_content
    {
      "count": 1,
      "color": "purple",
      "title": "Tracked Resource",
      "icon": "checkbox-tree"
    }
  end

  def variable_content(path)
    {
      "contents": [
        "text | #{path["name"]}",
        "fill",
        "section | Charges",
        "boxes | #{path["max"]} | 2.5"
      ]
    }
  end
end
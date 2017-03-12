require_relative 'card'

module PathfinderDeckBuilder
  class ArmorCard < Card

    def create_card(index=nil)
      super
    end

    def set_class_path
      @class_path = @armor_path
    end

    def assembled_card(path)
      super
    end

    def static_content
      {
        "count": 1,
        "color": "grey",
        "title": "Armor",
        "icon": "anvil"
      }   
    end

    def variable_content(path)
      {
        "contents": [
          "subtitle | #{path["name"]}",
          "rule",
          "property | AC | #{path["ac"]}",
          "property | Weight | #{path["weight"]["text"]}",
          "property | Cost | #{path["cost"]["text"]}",
          "property | Quantity | #{path["quantity"]}",
          "fill",
          "section | Description",
          "text | #{path["description"]}"[0..500]
        ]
      }
    end
  end
end
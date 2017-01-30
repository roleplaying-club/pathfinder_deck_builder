class Card
  attr_accessor :class_cards
  
  def initialize(xml_file=nil)
    @class_cards = []
    @xml_file = xml_file
  end

  def create_card(index=nil)
    @index = index
    set_paths
  end

  def set_paths
    @path_shortcut = @xml_file["document"]["public"]["character"]

    if @index
      set_multiple_character_path
    else
      set_single_character_path
    end
  end

  def set_single_character_path
    @character_path = @path_shortcut
    @ac_path = @path_shortcut["armorclass"]
    @initiative_path = @path_shortcut["armorclass"]
    @movement_path = @path_shortcut["movement"]
    @attack_path = @path_shortcut["attack"]
    @attribute_path = @path_shortcut["attributes"]["attribute"]
    binding.pry
    @defensive_ability_path = @path_shortcut["defensive"]["special"] if @path_shortcut["defensive"] != nil
    @feat_path = @path_shortcut["feats"]["feat"] if @path_shortcut["feats"] != nil
  end

  def set_multiple_character_path
    @character_path = @path_shortcut[@index]
    @ac_path = @path_shortcut[@index]["armorclass"]
    @initiative_path = @path_shortcut[@index]["armorclass"]
    @movement_path = @path_shortcut[@index]["movement"]
    @attack_path = @path_shortcut[@index]["attack"]
    @attribute_path = @path_shortcut[@index]["attributes"]["attribute"]
    binding.pry
    @defensive_ability_path = @path_shortcut[@index]["defensive"]["special"] if @path_shortcut[@index]["defensive"] != nil
    @feat_path = @path_shortcut[@index]["feats"]["feat"] if @path_shortcut[@index]["feats"] != nil
  end

  def assembled_card(path)
    static_content.merge(variable_content(path))
  end

  def static_content
    #non-iterative JSON goes here
  end

  def variable_content
    #iterative JSON goes here
  end
end
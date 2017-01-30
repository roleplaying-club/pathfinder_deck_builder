class Card
  attr_accessor :class_cards
  
  def initialize(xml_file=nil)
    @class_cards = []
    @xml_file = xml_file
  end

  def create_card(index=nil)
    @index = index
    set_path
  end

  def set_path
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
    @defensive_ability_path = @path_shortcut["defensive"]["special"] if @path_shortcut["defensive"] != nil
  end

  def set_multiple_character_path
    @character_path = @path_shortcut[@index]
    @ac_path = @path_shortcut[@index]["armorclass"]
    @initiative_path = @path_shortcut[@index]["armorclass"]
    @movement_path = @path_shortcut[@index]["movement"]
    @attack_path = @path_shortcut[@index]["attack"]
    @attribute_path = @path_shortcut[@index]["attributes"]["attribute"]
    @defensive_ability_path = @path_shortcut[@index]["defensive"]["special"] if @path_shortcut[@index]["defensive"] != nil
  end

  def assembled_card
    #the JSON for your card type goes
  end
end
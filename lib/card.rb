class Card
  attr_accessor :class_cards, :index
  
  def initialize(xml_file=nil)
    @class_cards = []
    @xml_file = xml_file
  end

  def create_card(index=nil)
    @index = index
    set_paths
    set_class_path

    unless @class_path.nil?
      if @class_path.class == Hash
        @class_cards.push(assembled_card(@class_path))
      else
        @class_path.each { |path| @class_cards.push(assembled_card(path)) }
      end
    end
  end

  def set_class_path
    @class_path = @character_path
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
    @defensive_ability_path = @path_shortcut["defensive"]["special"] if @path_shortcut["defensive"] != nil
    @feat_path = @path_shortcut["feats"]["feat"] if @path_shortcut["feats"] != nil
    @armor_path = @path_shortcut["defenses"]["armor"] if @path_shortcut["defenses"]["armor"] != nil
    @skill_path = @path_shortcut["skills"]["skill"] if @path_shortcut["skills"]["skill"] != nil
    @special_ability_path = @path_shortcut["otherspecials"]["special"] if @path_shortcut["otherspecials"]["special"] != nil
    @trait_path = @path_shortcut["traits"]["trait"] if @path_shortcut["traits"]["trait"] != nil
    @tracked_resource_path = @path_shortcut["trackedresources"]["trackedresource"] if @path_shortcut["trackedresources"]["trackedresource"] != nil
    @spell_path = @path_shortcut["spellsmemorized"]["spell"] if @path_shortcut["spellsmemorized"]["spell"] != nil
    @special_attack_path = @path_shortcut["attack"]["special"] if @path_shortcut["attack"]["special"] != nil
    @melee_weapon_path = @path_shortcut["melee"]["weapon"] if @path_shortcut["melee"]!= nil
    @ranged_weapon_path = @path_shortcut["ranged"]["weapon"] if @path_shortcut["ranged"] != nil
  end

  def set_multiple_character_path
    @character_path = @path_shortcut[@index]
    @ac_path = @path_shortcut[@index]["armorclass"]
    @initiative_path = @path_shortcut[@index]["armorclass"]
    @movement_path = @path_shortcut[@index]["movement"]
    @attack_path = @path_shortcut[@index]["attack"]
    @attribute_path = @path_shortcut[@index]["attributes"]["attribute"]
    @defensive_ability_path = @path_shortcut[@index]["defensive"]["special"] if @path_shortcut[@index]["defensive"] != nil
    @feat_path = @path_shortcut[@index]["feats"]["feat"] if @path_shortcut[@index]["feats"] != nil
    @armor_path = @path_shortcut[@index]["defenses"]["armor"] if @path_shortcut[@index]["defenses"]["armor"] != nil
    @skill_path = @path_shortcut[@index]["skills"]["skill"] if @path_shortcut[@index]["skills"]["skill"] != nil
    @special_ability_path = @path_shortcut[@index]["otherspecials"]["special"] if @path_shortcut[@index]["otherspecials"]["special"] != nil
    @trait_path = @path_shortcut[@index]["traits"]["trait"] if @path_shortcut[@index]["traits"]["trait"] != nil
    @tracked_resource_path = @path_shortcut[@index]["trackedresources"]["trackedresource"] if @path_shortcut[@index]["trackedresources"]["trackedresource"] != nil
    @spell_path = @path_shortcut[@index]["spellsmemorized"]["spell"] if @path_shortcut[@index]["spellsmemorized"] != nil
    @special_attack_path = @path_shortcut[@index]["attack"]["special"] if @path_shortcut[@index]["attack"]["special"] != nil
    @melee_weapon_path = @path_shortcut[@index]["melee"]["weapon"] if @path_shortcut[@index]["melee"] != nil
    @ranged_weapon_path = @path_shortcut[@index]["ranged"]["weapon"] if @path_shortcut[@index]["ranged"] != nil
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
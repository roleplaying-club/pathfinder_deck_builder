class Card
  attr_accessor :class_cards
  
  def initialize
    @class_cards = []
  end

  def create_card(xml_file, index=nil)
  #must_implement
  end

  def set_path
  #must_implement
  end
end
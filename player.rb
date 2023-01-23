class Player
  attr_accessor :lives, :name

  def initialize(name)
    @name = name
    @lives = 3
  end
  
  def reduce_life
    @lives -= 1
  end
end
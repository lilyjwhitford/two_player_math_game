class Player
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  # method to subtract 1 life
  def lose_life
    @lives -= 1
  end

  # method to check if player is alive
  def alive?
    @lives > 0
  end
end

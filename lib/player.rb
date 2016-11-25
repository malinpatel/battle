
class Player
  attr_reader :name, :hitpoints


  def initialize(name, hitpoints = 100)
    @name = name
    @hitpoints = hitpoints
  end

  def reduce_hitpoints(number = DEFAULT_DAMAGE)
    @hitpoints -= number
  end

  def switch_turn
    @turn = !@turn
  end

  private

  DEFAULT_DAMAGE = 10


end

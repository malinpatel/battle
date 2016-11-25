require_relative './player.rb'

class Game

  attr_reader :players, :current_turn

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_turn = player1
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  def attack
    if @current_turn == player1
      player2.reduce_hitpoints
      switch_turn(player1)
    else
      player1.reduce_hitpoints
      switch_turn(player2)
    end
  end

  def switch_turn(the_player)
    @current_turn = opponent_of(the_player)
  end

  def lose
    "#{player1.name} has lost!" if player1.hitpoints == 0
    "#{player2.name} has lost!" if player2.hitpoints == 0
  end

  def game_over?
    losing_players.any?
  end

  private

  def losing_players
    players.select { |player| player.hitpoints <= 0 }
  end

  def opponent_of(the_player)
    @players.select {|player| player != the_player}.first
  end


end

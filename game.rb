require './player.rb'
require './question.rb'

class Game
  # initialize game with two players and set default/current player to player1
  def initialize
    @player1 = Player.new("player 1")
    @player2 = Player.new("player 2")
    @current_player = @player1
  end

  # method to switch players
  def switch_turns
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
  end

  def play
    # continue game as long al both players are "alive"
    while @player1.alive? && @player2.alive?
      # generate new question
      question = Question.new
      answer = question.ask(@current_player)

      # check if answer is correct and output appropriate msg
      if answer == question.correct_answer
        puts "#{@current_player.name} YES! you are correct."
      else
        puts "#{@current_player.name} seriously? NO!"
        # if wrong, player loses 1 life
        @current_player.lose_life
      end

      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      puts "----- NEW TURN -----" if @player1.alive? && @player2.alive?
      switch_turns
    end

    if @player1.alive?
      puts "player 1 wins with a score of #{@player1.lives}/3"
    else
      puts "player 2 wins with a scor of #{@player2.lives}/3"
    end

    puts "----- GAME OVER -----"
    puts "good bye!"
  end
end
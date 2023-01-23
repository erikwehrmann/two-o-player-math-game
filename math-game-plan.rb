class Player
  # The role of this class is to keep track of the lives of each player and take in the input of the guess
  attr_accessor :lives
  def initialize(name)
    @name = name
    @lives = 3
  end
  def reduce_life
    @lives -= 1
  end
  # def guess=(gets.chomp)
  # end
end

class Question
  # The role of this class to to generate the two numbers and the using find the answer 
  # attr_accessor :number1, :number2, :answer
  def initialize
    @number1 = rand 1..20
    @number2 = rand 1..20
    @answer = @number1 + @number2
  end
end

class Game
  # will evaluate the guess from the player against the answer from the question, then output the message, then output the new lives of eachplayers, then output new turn if both players are still in or output game over if one player has 0 lives and keep track of the player whose turn it is
  def initialize(p1, p2)
    @P1 = p1
    @P2 = p2
    @current_player = @P1
    @round = 0
  end

  include Question

  def start_of_round
    # new question
    puts "#{@current_player.name}: What's #{} plus #{}"
  end  

  guess = gets.chomp

  def evaluate_guess
    if guess == question.answer
      puts "#{@current_player.name}: YES! You are correct."
    else
      puts "#{@current_player.name}: Seriously? No!"
      @current_player.reduce_life
    end
  end

  def end_of_round
    if @P1.lives > 0 && @P2.lives > 0
      puts "P1: #{@P1.lives}/3 P2: #{@P2.lives}/3"
      puts "----- NEW TURN -----"
      if @current_player = @P1
        @current_player = @P2
      else
        @current_player = @P1
      end
      @round += 1
    elsif @P1.lives == 0
      puts "#{@P2.name} wins with a score of #{@P2.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    elsif @P2.lives == 0
      puts "#{@P1.name} wins with a score of #{@P1.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    end
  end
end
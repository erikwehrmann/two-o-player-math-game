require "./question.rb"

class Game
  attr_accessor :P1, :P2, :current_player
  def initialize(p1, p2)
    @P1 = p1
    @P2 = p2
    @current_player = @P1
  end

  def start_of_round
    @question = Question.new
    puts "#{@current_player.name}: What's #{@question.number1} plus #{@question.number2}?"
    puts "#{@question.answer}"
  end

  def access_guess
    guess = gets.chomp.to_i
    answer = @question.answer
    if guess == answer
      puts "#{@current_player.name}: YES! You are correct."
    elsif guess != answer
      puts "#{@current_player.name}: Seriously? No!"
      @current_player.reduce_life
    end
  end

  def end_of_round
    if @P1.lives > 0 && @P2.lives > 0
      puts "P1: #{@P1.lives}/3 P2: #{@P2.lives}/3"
      puts "----- NEW TURN -----"
      if @current_player == @P1
        @current_player = @P2
      elsif @current_player == @P2
        @current_player = @P1
      end
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
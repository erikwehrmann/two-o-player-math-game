require "./player.rb"
require "./game.rb"

player1 = Player.new("Player 1")
player2 = Player.new("Player 2")

game = Game.new(player1, player2)

while player1.lives && player2.lives do
  game.start_of_round
  game.access_guess
  game.end_of_round
end

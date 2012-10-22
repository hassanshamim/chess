require './controller.rb'

puts "Please enter name for Player 1"
p1 = gets.chomp
puts "Please enter name for Player 2"
p2 = gets.chomp

game = Controller.new(p1, p2)
game.play_game

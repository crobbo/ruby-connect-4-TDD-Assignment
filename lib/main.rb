require_relative 'game.rb'
require_relative 'board.rb'

new_game = Game.new
# p new_game.grid
# new_game.play_game

grid = Array.new(6) {Array.new(7) { " " } }

# grid =  
# [[" ", " ", " ", " ", " ", " ", " "],
#     [" ", " ", " ", " ", " ", " ", " "],
#     [" ", " ", " ", " ", " ", "X", " "],
#     [" ", " ", " ", " ", "X", " ", " "],
#     [" ", " ", " ", "X", " ", " ", " "],
#     [" ", " ", "X", " ", " ", " ", " "],
#     [" ", " ", " ", " ", " ", " ", " "]]


p new_game.rotate90(grid)
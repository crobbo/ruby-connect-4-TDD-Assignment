require 'pry'
require 'io/console'
require 'pp'

class Game

  attr_reader :grid

  def initialize(board=Board.new)
    @board = board
    @grid = board.grid
    @columns = board.columns
    @player1 = true
    @players = {player1: 'X', player2: 'O'}
  end

  def play_game
    puts "Welcome to Connect 4"
    continue
    until four_in_a_row(grid)
      pp @grid
      pp @columns
      if @player1
        puts "Player 1: Place counter between columns 1-7"
        num = gets.chomp.to_i
        add_counter(num)
        @player1 = false
      else
        puts "Player 2: Place counter between columns 1-7"
        num = gets.chomp.to_i
        add_counter(num)
        @player1 = true
      end
    end
  end

  def continue
    print "press any key to start game.."
    STDIN.getch
    print "            \r" # extra space to overwrite in case next sentence is short
  end

  def add_counter(col)
    place_here = which_row_empty(col)
    # binding.pry
    if @player1
      counter = "X"
    else
      counter = "0"
    end
    @grid[place_here][col-1] = counter
  end

  def which_row_empty(col)
    empty_rows = []
    @grid.each do |array|
      if array[col-1] == " "
        empty_rows << true
      else
        empty_rows << false
      end
    end
    return 5 - (empty_rows.reverse.find_index(true))
  end
  
  def four_in_a_row(grid)
   check_win_horizontal(grid) ||
   check_win_horizontal(grid.transpose) ||
   check_win_horizontal(diagonals(grid)) ||
   check_win_horizontal(diagonals(rotate90(grid)))
  end

  def check_win_horizontal(arr)
    arr.each do |row|
      a = row.each_cons(4).find { |a| a.uniq.size == 1 && a.first != " " }
      return a.first unless a.nil?
    end
    nil
  end

  def diagonals(grid)
    (0..grid.size-4).map do |i|
      (0..grid.size-1-i).map { |j| grid[i+j][j] }
    end.concat((1..grid.first.size-4).map do |j|
      (0..grid.size-j-1).map { |i| grid[i][j+i] }
    end)
  end
  
  def rotate90(grid)
    ncols = grid.first.size
    grid.each_index.with_object([]) do |i,a|
      a << ncols.times.map { |j| grid[j][ncols-1-i] }
    end
  end
end

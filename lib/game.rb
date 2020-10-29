require 'io/console'
require 'pp'
require 'pry'

class Game

  attr_reader :grid

  def initialize(board=Board.new)
    @board = board
    @grid = board.grid
    @player1 = true
  end

  def play_game
    puts "Welcome to Connect 4"
    continue
    until four_in_a_row(grid)
      pp @grid
      if @player1
        puts "Player 1: Place counter between columns 1-7"
        input = user_input()
        add_counter(input)
        @player1 = false
      else
        puts "Player 2: Place counter between columns 1-7"
        input = user_input()
        add_counter(input)
        @player1 = true
      end 
    end
    pp grid
    if four_in_a_row(grid) == "X"
      puts "Player 1 Wins!"
    elsif four_in_a_row(grid) == "O"
      puts "Player 2 Wins!"
    else
      puts "Its a draw!"
    end
  end

  def user_input
    num = loop do
      puts "enter a number"
      num = Integer(gets) rescue nil
      break num if num
    
      puts "you didn't enter a number..."
    end

    return num 
 end


  def continue
    print "press any key to start game.."
    STDIN.getch
    print "            \r"
  end

  def add_counter(col)
    place_here = which_row_empty(col)
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
      if array[col-1] == "."
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
   check_win_horizontal(antediagonals((grid)))
  end

  def check_win_horizontal(arr)
    arr.each do |row|
      a = row.each_cons(4).find { |a| a.uniq.size == 1 && a.first != "." }
      return a.first unless a.nil?
    end
    nil
  end

  def antediagonals(grid)
    a = []
    a << (0..5).map { |i| grid[grid.size-1-i][i]}
    a << (0..5).map { |i| grid[grid.size-1-i][i+1]}
    a << (0..4).map { |i| grid[grid.size-1-i][i+2]}
    a << (0..3).map { |i| grid[grid.size-1-i][i]}
    a << (0..4).map { |i| grid[grid.size-2-i][i]}
    a << (0..3).map { |i| grid[grid.size-3-i][i]}  
  end
  
  def diagonals(grid)
  arr = []
  arr << (0..5).map {|i| grid[i][i]}
  arr << (0..5).map {|i| grid[i][i+1]}
  arr << (0..4).map {|i| grid[i][i+2]}
  arr << (0..3).map {|i| grid[i][i+3]}
  arr << (0..4).map {|i| grid[i+1][i]}
  arr << (0..3).map {|i| grid[i+2][i]}
  end
end

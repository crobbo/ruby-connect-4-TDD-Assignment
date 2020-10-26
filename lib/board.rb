class Board
  attr_reader :grid, :columns

  def initialize
    @grid = Array.new(6) {Array.new(7) { " " } }
    @columns = [["-", "-", "-", "-", "-", "-", "-"],
                ["1", "2", "3", "4", "5", "6", "7"]
                ]
  end
end

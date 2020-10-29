class Board
  attr_reader :grid, :columns

  def initialize
    @grid = [
      %w| . . . . . . . |,
      %w| . . . . . . . |,
      %w| . . . . . . . |,
      %w| . . . . . . . |,
      %w| . . . . . . . |,
      %w| . . . . . . . |
    ]
  end
end

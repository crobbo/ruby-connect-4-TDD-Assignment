require 'rspec/autorun'
require '/home/chrisrobbo/Programming/ruby-connect-4-TDD-Assignment/lib/game.rb'
require '/home/chrisrobbo/Programming/ruby-connect-4-TDD-Assignment/lib/board.rb'

describe Game do
  let(:game) {Game.new}
  let(:grid) {game.grid}

  it "Checks counter is added when column's empty" do
    game.add_counter(2)
    expect(game.grid).to eq([
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", "X", ".", ".", ".", ".", "."]
    ])
  end

  it "Checks antediagonal winner" do
          grid =  [
          [".", ".", ".", ".", "X", ".", "."],
          [".", ".", ".", "X", ".", ".", "."],
          [".", ".", "X", ".", ".", ".", "."],
          [".", "X", ".", ".", ".", ".", "."],
          [".", ".", ".", ".", ".", ".", "."],
          [".", ".", ".", ".", ".", ".", "."]
        ]

    expect(game.four_in_a_row(grid)).to eq("X")
    end

    it "Checks diagonal winner" do
      
          grid = [
          [".", ".", ".", ".", ".", ".", "."],
          [".", ".", ".", ".", ".", ".", "."],
          [".", "X", ".", ".", ".", ".", "."],
          [".", ".", "X", ".", ".", ".", "."],
          [".", ".", ".", "X", ".", ".", "."],
          [".", ".", ".", ".", "X", ".", "."]
        ]
      expect(game.four_in_a_row(grid)).to eq("X")
      end

    it "Checks horizontal winner" do
      grid = [
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", "X", "X", "X", "X", ".", "."],
      [".", ".", ".", ".", ".", ".", "."]
    ]
      expect(game.four_in_a_row(grid)).to eq("X")
      end

    it "Checks vertical winner" do
              grid = [
              [".", ".", ".", ".", ".", ".", "."],
              [".", ".", ".", ".", ".", ".", "."],
              [".", "X", ".", ".", ".", ".", "."],
              [".", "X", ".", ".", ".", ".", "."],
              [".", "X", ".", ".", ".", ".", "."],
              [".", "X", ".", ".", ".", ".", "."]
            ]
        expect(game.four_in_a_row(grid)).to eq("X")
        end
end
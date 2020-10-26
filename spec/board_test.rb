require 'rspec/autorun'
require '/home/chrisrobbo/Programming/ruby-connect-4-TDD-Assignment/lib/board.rb'

describe Board do
  let(:board) {Board.new}
  it "Checks to see if game board is created" do
    expect(board.grid).to eq([[" ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " "]
                            ])
  end
end
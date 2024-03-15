

class Pawn
  attr_reader :color, :board
  attr_accessor :position

  def initialize(color, position, board)
    @color, @position, @board = color, position, board
    board[position] = self
  end
end
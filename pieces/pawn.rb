require_relative "piece"

class Pawn < Piece

  def picture
    "\u265F"
  end

  def moves
    forward_moves + diagonal_attacks
  end

  def forward_moves
    moves = []
    one_step = [row + direction, col]
    two_step = [row + (direction * 2), col]

    moves << one_step if board[one_step].nil?
    moves << two_step if board[one_step].nil? && board[two_step].nil? && unmoved
    
    moves
  end

  def diagonal_attacks
    []
  end

  def direction
    color == :white ? -1 : 1
  end

  def unmoved
    color == :white && row == 6 || color == :black && row == 1
  end

  def row
    position[0]
  end

  def col
    position[1]
  end
end
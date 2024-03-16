# require_relative "piece"

class Knight < Piece
include Steppable

  def picture
    "\u265E"
  end
  def moves 
    moves = []
    movements.each do |movement|
      move = [row + movement[0], col + movement[1]]
      moves << move if board.on?(move) && (board[move].nil? || board[move].color != color)
    end
    moves
  end

  def movements
    [
      [-2, -1], # Move two squares up and one square to the left
      [-2, 1],  # Move two squares up and one square to the right
      [2, -1],  # Move two squares down and one square to the left
      [2, 1],   # Move two squares down and one square to the right
      [-1, -2], # Move one square up and two squares to the left
      [-1, 2],  # Move one square up and two squares to the right
      [1, -2],  # Move one square down and two squares to the left
      [1, 2],    # Move one square down and two squares to the right
    ]
  end
end

module Slideable

  def moves
    moves =[]
    directions.each do |direction|
      (1..7).each do |i|
        move = [row + (direction[0] * i), col + (direction[1] * i)]
        next unless board.on?(move)
        moves << move if board[move].nil? || board[move].color !=color
        next unless board[move].nil?
      end
    end
    moves
  end

  def straight_direction
    [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
    ]
  end

  def diagonal_direction
    [
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1],
    ]
  end
end
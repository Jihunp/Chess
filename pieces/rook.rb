class Rook < Piece
include Slideable


  def picture
    "\u265C"
  end


  def directions
    [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
    ]
  end

end
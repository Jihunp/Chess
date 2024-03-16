class Bishop < Piece
include Slideable

  def picture
    "\u265D"
  end

  def directions
    diagonal_direction
  end

end
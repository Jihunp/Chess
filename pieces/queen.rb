
class Queen < Piece
include Slideable

  def picture
    "\u265B"
  end
  
  def directions
    straight_direction + diagonal_direction
  end
end
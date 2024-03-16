class Rook < Piece
include Slideable


  def picture
    "\u265C"
  end


  def directions
    straight_direction
  end

end
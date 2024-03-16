class Bishop < Piece
include Slideable

  def picture
    "\u265D"
  end

  def directions
    [
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1],
    ]
  end

end
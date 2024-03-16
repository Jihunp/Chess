class King < Piece
include Steppable

  def picture
    "\u2654"
  end

  def movements
    [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0],
      [-1,1 ],
      [-1, -1],
      [1, -1],
      [1, 1],
    ]
  end

end
class Rook < Piece
  def picture
    "\u265C"
  end

  def moves
    moves =[]
    directions.each do |direction|
      move = [row + direction[0], col + direction[1]]
      #do something
    end
  end


end
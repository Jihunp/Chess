require_relative "../pieces"

class Piece
  attr_reader :color, :board
  attr_accessor :position

  def initialize(color, position, board)
    @color, @position, @board = color, position, board
    board[position] = self
  end

  def display
    " #{picture}".colorize(color: colorize_color)
  end
  def colorize_color
    color == :white ? :light_white : :black
  end
  def row
    position[0]
  end

  def col
    position[1]
  end
end


# class Piece
#   attr_reader :color, :board
#   attr_accessor :position

#   def initialize(color, position, board)
#     @color, @position, @board = color, position, board

#     board.set_piece(position, self)
#   end

#   def display
#     " #{picture} ".colorize(color: colorize_color)
#   end

#   def colorize_color
#     color == :white ? :light_white : :black
#   end

#   def moves
#     []
#   end
# end
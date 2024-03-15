require "colorize"
require_relative "pieces"

class Board
  def initialize (fill_board = true)
    @rows = Array.new(8){ Array.new(8)} #8x8 array
    set_up_pieces
  end

  def []=(position, piece)
    row, col = position
    @rows[row][col] = piece
  end
  def [](position)
    row, col = position
    @rows[row][col]
  end

  def checkmate?(color) # (?)returns a bool
    false
  end

  def move_piece(turn_color, start_pos, end_pos)
    piece = self[start_pos]
    # raise "must pick a piece" if piece.nil?
    # raise "must pick own piece" if piece.color != turn_color
    # raise "INVALID MOVE" if piece.moves.include?(end_pos)

    self[start_pos] = nil
    self[end_pos] = piece
  end

  def set_up_pieces
    (0..7).each { |i| Pawn.new(:white, [6, i], self) }
    [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].each_with_index do |piece, i|
      piece.new(:white, [7, i], self)
    end
      
    (0..7).each { |i| Pawn.new(:black, [1, i], self) }
    [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].each_with_index do |piece, i|
      piece.new(:black, [0, i], self)
    end
  end

  def display
    @rows.each_with_index do |row, i|
      row.each_with_index do |square, j|
        bg = (i + j).even? ? :white : :light_black
        piece_display = square.nil? ? "  " : square.display #unicode spacing is way off. NEED TO FIX
        print piece_display.colorize(background: bg)
      end
      puts
    end
  end
end
require "colorize"
require_relative "pieces"

class Board
  def initialize (fill_board = true)
    @rows = Array.new(8){ Array.new(8)} #8x8 array
    set_up_pieces if fill_board
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
    current_pieces(color).each do |piece|
      return false unless piece.valid_moves.empty?
    end
    true
  end

  def move_piece(turn_color, start_pos, end_pos)
    piece = self[start_pos]
    raise "must pick a piece" if piece.nil?
    raise "must pick own piece" if piece.color != turn_color

    p "#{piece.class} at #{piece.position} has moves: #{piece.moves}"
    raise "INVALID MOVE" unless piece.moves.include?(end_pos)

    move_piece!(start_pos, end_pos)
  end

  def move_piece!(start_pos, end_pos)
    self[start_pos] = nil
    self[end_pos] = piece
    piece.position = end_pos
  end

  def on?(end_pos)
    end_row, end_col = end_pos
    end_row.between?(0,7) && end_col.between?(0, 7)
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

  def pieces
    @rows.flatten.reject { |square| square.nil? }
  end

  def current_pieces(color)
    pieces.filter {|piece| piece.color == color }
  end

  def enemy_pieces(color)
    pieces.reject {|piece| piece.color == color}
  end

  def dup
    temp_board = Board.new(false)

    pieces.each do |piece|
      piece.class.new(piece.color, piece.position, temp_board)
    end

    temp_board

  end




  def display
    @rows.each_with_index do |row, i|
      row.each_with_index do |square, j|
        bg = (i + j).even? ? :white : :light_black
        piece_display = square.nil? ? "  " : square.display
        print piece_display.colorize(background: bg)
      end
      puts
    end
  end
end
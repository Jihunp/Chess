require_relative "pieces"
require "colorize"

class Board
  def initialize (fill_board = true)
    @rows = Array.new(8){ Array.new(8)} #8x8 array
  end

  def checkmate?(color) # (?)returns a bool
    false
  end

  def move_piece(turn_color, start_pos, end_pos)
  end

  def display
    @rows.each_with_index do |row, i|
      row.each_with_index do |square, j|
        bg = (i + j).even? ? :white : :black
        piece_display = square.nil? ? "   " : square.display
        print piece_display.colorize(background: bg)
      end
      puts
    end
  end
end
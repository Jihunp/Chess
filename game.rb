require_relative "board"

class Game
  attr_reader :board, :current_player
  
  ROW_HASH = (1..8).to_a.map(&:to_s).zip((0..7).to_a.reverse).to_h
  COL_HASH = ("a".."h").to_a.zip((0..7).to_a).to_h
  
  def initialize
    @board = Board.new
    @current_player = :white
  end

  def play
    until board.checkmate?(current_player)
      board.display
      begin
        puts "#{current_player}'s turn"
        puts "Enter position of piece:"
        start_pos = to_coord(gets.chomp)
        puts "Enter position to move:"
        end_pos = to_coord(gets.chomp)
        
        board.move_piece(current_player, start_pos, end_pos)
        swap_turn!
      rescue StandardError => e
        puts e.message
        retry
      end
    end
    puts "#{current_player} is checkmated"

    nil
  end
  []

end
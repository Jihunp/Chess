class Rook
  def initialize(color)
    @color = color
  end

  def display
    return " \u265C ".colorize(color: :light_white) if @color == 'white'
    return " \u265C ".colorize(color: :light_black) if @color == 'black'
  end

  def color
    @color
  end
end

class ChessGame
  def initialize
    @board = Board.new
    @whites_turn = true
  end

  def play
    loop do
      @board.display
      puts "turn: White" if @whites_turn
      puts "turn: Black" unless @whites_turn
      puts "What piece would you like to move?"
      start_coord = gets.chomp

      puts "Where would you like to move it to?"
      end_coord = gets.chomp

      moved = @board.move_piece(start_coord, end_coord, @whites_turn)

      puts "INVALID MOVE! try again!" unless moved
      next unless moved

      @whites_turn = !@whites_turn
    end
  end
end

game = ChessGame.new
game.play
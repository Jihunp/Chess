# Ruby Chess Game

This is a command-line chess game built in Ruby, designed to run in the Interactive Ruby (IRB) environment. The game features classic chess mechanics, including piece movements, check, and checkmate conditions. It consists of two main classes, `Game` and `Board`, along with individual classes for each chess piece.

## Features

- **Command-Line Interface**: The game runs entirely in the IRB console, making it lightweight and easy to execute.
- **Basic Chess Mechanics**: Supports standard chess rules, including piece-specific moves, turn-based gameplay, and checks for checkmate.
- **Check and Checkmate Detection**: Alerts players when they are in check and stops the game upon checkmate.
- **Colorized Board Display**: The board is color-coded for a visually clear experience, using the `colorize` gem for display.

## Game Overview

### Class Structure

- **`Game`**: Manages the main gameplay loop, prompts players for moves, checks for check and checkmate conditions, and manages turns.
- **`Board`**: Handles the setup and display of the chessboard, movement logic, and check/checkmate conditions.

### Key Methods

- **`Game#play`**: Main game loop where players input moves in the console. It validates moves and alternates turns.
- **`Board#display`**: Renders the chessboard in the console with pieces and colored squares.
- **`Board#move_piece`**: Validates and executes piece moves while checking game rules.
- **`Board#in_check?`**: Checks if the current player's king is in check.
- **`Board#checkmate?`**: Determines if the current player is in checkmate.

### Coordinate Conversion

The game uses algebraic notation (e.g., `a2`, `h3`) for piece selection and movement. This is converted internally to array coordinates for board manipulation.

```ruby
  ROW_HASH = (1..8).to_a.map(&:to_s).zip((0..7).to_a.reverse).to_h
  COL_HASH = ("a".."h").to_a.zip((0..7).to_a).to_h
```

### Example Gameplay
The following commands outline how to play the game in IRB:

1. Start IRB and load the game:

```ruby
require_relative 'game'
Game.new.play
```
2. Input Moves: Players are prompted to enter positions for piece movement in algebraic notation (e.g., a2 to a4 for a pawn move).

3. Game Messages:
- Turn Notification: Displays which player's turn it is.
- Check Warning: Alerts if the player is in check.
- Error Handling: Prompts for a valid move if an invalid one is entered.

4. End of Game: Displays a message when a player is checkmated, ending the game.

###Installation and Setup
1. Clone the repository:

```bash
git clone https://github.com/yourusername/ruby-chess-game.git
cd ruby-chess-game
```
2. Install the colorize gem (if not already installed):

```bash
gem install colorize
```
3. Run in IRB:
```ruby
irb
require_relative 'game'
Game.new.play
```

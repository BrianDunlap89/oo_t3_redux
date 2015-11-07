class Board

  attr_reader :board

  WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], 
          [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    @board = (1..9).to_a
  end
  
  def show_board
    puts "
     #{@board[0]} | #{@board[1]} | #{@board[2]}
     #{@board[3]} | #{@board[4]} | #{@board[5]}
     #{@board[6]} | #{@board[7]} | #{@board[8]} 
     \n"
  end

  def available_moves
    @board.reject { |x| x.is_a?(String) }
  end

  def mark_board(choice, mark)
    @board[choice - 1] = mark
  end

  def win?
    WINS.any? do |x, y, z|
      @board[x] == @board[y] && @board[y] == @board[z]
    end
  end

  def draw?
    @board.all? { |space| space.is_a?(String) }
  end

  def game_over?
    self.win? || self.draw?
  end
end
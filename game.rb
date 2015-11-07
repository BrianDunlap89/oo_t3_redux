class Game
  def initialize
    @p1 = HumanPlayer.new
    @board = Board.new
  end

  def greeting
    puts "Welcome to Tic Tac Toe!"
    player_choice = @p1.choose_opponent
    player_choice == "H" ? @p2 = HumanPlayer.new : @p2 = ComputerPlayer.new
    @p1.mark = "X"
    @p2.mark = "O"
  end

  def turn_cycle
    @current_player = @p1
    until @board.game_over?
      @board.show_board
      choice = @current_player.player_turn.to_i
      until @board.available_moves.include?(choice)
        choice = @current_player.validate.to_i  
      end
      @board.mark_board(choice, @current_player.mark)
      @current_player.mark = self.switch_player
    end
  end

  def switch_player
    @current_player.mark == "X" ? "O" : "X"
  end

  def aftermath
    if @board.win?
      puts "Congratulations, Player #{@current_player.mark}, you win!"
    else
      puts "No dice! It's a draw."
    end
  end

  def play_again?
    puts "Would you like to play again? (Y/N)"
    choice = gets.chomp.upcase
    until @p1.yes_no?(choice)
      choice = @p1.validate
    end
    unless choice == "N"
      game = Game.new
      game.play
    end
  end

  def play
      self.greeting
      self.turn_cycle
      self.switch_player
      self.aftermath
      self.play_again?
  end
end
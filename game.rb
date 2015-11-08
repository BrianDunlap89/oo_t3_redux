class Game
  def initialize
    @p1 = HumanPlayer.new
    @current_player = @p1
    @board = Board.new
    @scoreboard = Scoreboard.new
  end

  def greeting
    puts "Welcome to Tic Tac Toe!"
    player_choice = @p1.choose_opponent
    player_choice == "H" ? @p2 = HumanPlayer.new : @p2 = ComputerPlayer.new
    @p1.mark = "X"
    @p2.mark = "O"
    @mark = @current_player.mark
  end

  def turn_cycle
    until @board.game_over?
      @board.show_board
      moves = @board.available_moves
      choice = @current_player.player_turn(moves)
      @board.mark_board(choice, @mark)
      self.switch_player
    end
  end

  def switch_player
    @current_player == @p1 ? @current_player = @p2 : @current_player = @p1
    @mark = @current_player.mark
  end

  def aftermath
    @board.show_board
    if @board.win?
      puts "Congratulations, Player #{@current_player.mark}, you win!"
      if @current_player == @p1
        @scoreboard.add_wins(1, 0)
        @scoreboard.add_losses(0, 1)
      else 
        @scoreboard.add_wins(0, 1)
        @scoreboard.add_losses(1, 0)
      end
    else
      puts "No dice! It's a draw."
      @scoreboard.add_draws(1)
    end
    @scoreboard.display_scoreboard
  end

  def play_again?
    puts "Would you like to play again? (Y/N)"
    choice = gets.chomp.upcase
    @p1.valid_response?(choice)
    unless choice == "N"
      @board = Board.new
      self.play
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
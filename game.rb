class Game
  def initialize
    @p1 = HumanPlayer.new
    @board = Board.new
    @scoreboard = Scoreboard.new
  end

  def greeting
    puts "Welcome to Tic Tac Toe!\n"
    player_choice = @p1.choose_opponent
    player_choice == "H" ? @p2 = HumanPlayer.new : @p2 = ComputerPlayer.new
    @p1.mark = "X"
    @p2.mark = "O"
    @mark = @current_player.mark
  end

  def turn_cycle
    until @board.game_over?
      @board.show_board
      choice = @current_player.player_turn(@board.available_moves)
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
      puts "Congratulations, Player #{@mark}, you win!\n"
      if @current_player == @p1
        @scoreboard.p1_win
      else 
        @scoreboard.p2_win
      end
    else
      puts "No dice! It's a draw.\n"
      @scoreboard.draw
    end
    @scoreboard.display_scoreboard
  end

  def play_again?
    puts "Would you like to play again? (Y/N)/n"
    choice = gets.chomp.upcase
    @p1.valid_response?(choice)
    unless choice == "N"
      @board = Board.new
      self.play
    end
    puts "Thanks for playing!"
  end

  def play
    @current_player = @p1
    self.greeting
    self.turn_cycle
    self.switch_player
    self.aftermath
    self.play_again?
  end
end
class ComputerPlayer

  attr_accessor :mark

  def player_turn(moves)
    puts "Player 2 Is Thinking... "
    sleep(2)
    choice = moves.sample
  end
end
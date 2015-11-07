class HumanPlayer
  
  attr_accessor :mark

  def choose_opponent
    puts "Would you like to play against another human or a computer (H/C)?"
    choice = gets.chomp.upcase
    valid = ["H", "C"]
    until valid.include?(choice)
      puts "Please choose either a (H)uman or (C)omputer."
      choice = gets.chomp.upcase
    end
    choice
  end

  def player_turn(moves)
    puts "Please choose an available space: "
    choice = gets.chomp.to_i
    until moves.include?(choice)
      choice = self.reprompt.to_i
    end
    choice
  end

  def reprompt
    puts "That was not a valid entry. Please try again: "
    choice = gets.chomp
  end

  def valid_response?(choice)
    valid = ["Y", "N"]
    until valid.include?(choice)
      choice = self.reprompt
    end
    choice
  end
end
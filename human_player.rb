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

  def player_turn
    puts "Please choose an available space: "
    choice = gets.chomp
  end

  def validate
    puts "That was not a valid entry. Please try again: "
    choice = gets.chomp
    choice
  end

  def yes_no?(choice)
    valid = ["Y", "N"]
    valid.include?(choice)
  end
end
class Scoreboard

  def initialize
    @scoreboard = []
    @p1_stats = { 
                  "Player 1 Wins" => 0,
                  "Player 1 Losses" => 0
                }
    @p2_stats = {
                  "Player 2 Wins" => 0,
                  "Player 2 Losses" => 0
                }
    @draws = { "Draws" => 0 }
    @scoreboard << @p1_stats << @p2_stats << @draws
  end

  def p1_win
    @p1_stats["Player 1 Wins"] += 1
    @p2_stats["Player 2 Losses"] += 1
  end

  def p2_win
    @p1_stats["Player 1 Losses"] += 1
    @p2_stats["Player 2 Wins"] += 1
  end

  def draw
    @draws["Draws"] += 1
  end

  def display_scoreboard
    @scoreboard.each do |hash|
      hash.each do |key, value|
        puts "#{key}: #{value}"
      end
    end
  end
end
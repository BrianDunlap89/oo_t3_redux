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

  def add_wins(p1_wins, p2_wins)
    @p1_stats["Player 1 Wins"] += p1_wins
    @p2_stats["Player 2 Wins"] += p2_wins
  end

  def add_losses(p1_losses, p2_losses)
    @p1_stats["Player 1 Losses"] += p1_losses
    @p2_stats["Player 2 Losses"] += p2_losses
  end

  def add_draws(draws=0)
    @draws["Draws"] += draws
  end

  def display_scoreboard
    @scoreboard.each do |hash|
      hash.each do |key, value|
        puts "#{key}: #{value}"
      end
    end
  end
end
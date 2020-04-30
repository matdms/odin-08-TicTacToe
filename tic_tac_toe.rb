
class Board
  def initialize()
    @plateau = ["_", "_", "_", "_", "_", "_", " ", " ", " "]
  end

  def update(pos, value)
    @plateau[pos] = value
  end

  def display()
    puts "  #{@plateau[0]}|#{@plateau[1]}|#{@plateau[2]}"
    puts "  #{@plateau[3]}|#{@plateau[4]}|#{@plateau[5]}"
    puts "  #{@plateau[6]}|#{@plateau[7]}|#{@plateau[8]}"
    puts " "
  end

end

class Player
  attr_accessor = :name, :symbol, :score

  @@nbr_players = 0

  def self.nbr_players()
    @@nbr_players
  end

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @score = 0
    @@nbr_players += 1
  end

  def display()
    puts "#{@name} joue avec les #{@symbol}. Score: #{@score}"
  end  

  def score_point()
    @score += 1
  end

end


puts "Tic Tac Toe"

puts "Nombre de joueurs: #{Player.nbr_players}"

board = Board.new
board.display
board.update(3,"O")
board.update(2,"X")
board.update(7,"O")
board.display

joueur1 = Player.new("Alice", "X")
joueur2 = Player.new("Tom", "O")
joueur1.display
joueur2.display
puts "Nombre de joueurs: #{Player.nbr_players}"
joueur2.score_point
joueur2.score_point
joueur1.display
joueur2.display

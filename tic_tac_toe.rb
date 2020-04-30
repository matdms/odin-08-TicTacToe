
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

  def check_win()
    if ( ( ( @plateau[0] == @plateau[4] ) && ( @plateau[4] == @plateau[8] ) && ( @plateau[4] != "_" ) && ( @plateau[4] != " " ) ) ||
         ( ( @plateau[1] == @plateau[4] ) && ( @plateau[4] == @plateau[7] ) && ( @plateau[4] != "_" ) && ( @plateau[4] != " " ) ) ||
         ( ( @plateau[2] == @plateau[4] ) && ( @plateau[4] == @plateau[6] ) && ( @plateau[4] != "_" ) && ( @plateau[4] != " " ) ) ||
         ( ( @plateau[3] == @plateau[4] ) && ( @plateau[4] == @plateau[5] ) && ( @plateau[4] != "_" ) && ( @plateau[4] != " " ) ) )
      return @plateau[4]
    elsif ( ( ( @plateau[0] == @plateau[1] ) && ( @plateau[0] == @plateau[2] ) && ( @plateau[0] != "_" ) && ( @plateau[0] != " " ) ) ||
            ( ( @plateau[0] == @plateau[3] ) && ( @plateau[0] == @plateau[6] ) && ( @plateau[0] != "_" ) && ( @plateau[0] != " " ) ) )
      return @plateau[0]
    elsif ( ( ( @plateau[8] == @plateau[5] ) && ( @plateau[8] == @plateau[2] ) && ( @plateau[8] != "_" ) && ( @plateau[8] != " " ) ) ||
            ( ( @plateau[8] == @plateau[7] ) && ( @plateau[8] == @plateau[6] ) && ( @plateau[8] != "_" ) && ( @plateau[8] != " " ) ) )
      return @plateau[8]
    end
  end

end

class Player
  attr_accessor :name, :symbol, :score

  @@nbr_players = 0

  def self.nbr_players()
    @@nbr_players
  end

  def initialize(symbol)
    @@nbr_players += 1
    puts "Nom du Joueur #{@@nbr_players} ?"
    @name = gets.chomp
    @symbol = symbol
    @score = 0    
  end

  def display()
    puts "#{@name} joue avec les #{@symbol}. Score: #{@score}"
  end  

  def score_point()
    @score += 1
  end

end


puts "Tic Tac Toe"
puts " "
# puts "Nombre de joueurs: #{Player.nbr_players}"

# joueur1 = Player.new("Alice", "X")
joueur1 = Player.new("X")
joueur2 = Player.new("O")
puts " "
puts "#{Player.nbr_players} joueurs :"
joueur1.display
joueur2.display
puts " "
# joueur2.score_point
# joueur2.score_point
# joueur1.display
# joueur2.display
# puts joueur2.name
# puts joueur2.symbol
# puts joueur2.score

board = Board.new
board.display

board.update(0,"O")
board.display
if board.check_win
  puts "#{board.check_win} wins"
end

board.update(4,"O")
board.display
if board.check_win
  puts "#{board.check_win} wins"
end

board.update(8,"O")
board.display
if board.check_win
  puts "#{board.check_win} wins"
end
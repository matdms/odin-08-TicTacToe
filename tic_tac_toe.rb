
class Board
  def initialize()
    @plateau = ["_", "_", "_", "_", "_", "_", " ", " ", " "]
  end

  def update(pos, value)
    if (@plateau[pos] == "_" || @plateau[pos] == " ")
      @plateau[pos] = value
    end
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

  def play()
    puts "Au tour de #{@name}"
    puts "  1|2|3"
    puts "  4|5|6"
    puts "  7|8|9"
    puts "Choix ?"
    @choix = gets.chomp.to_i
    return @choix
  end
end


puts "Tic Tac Toe"
puts " "

joueurs = []

joueurs[0] = Player.new("X")
joueurs[1] = Player.new("O")

new_game = 1

while new_game == 1 do
  puts " "
  puts "Continuer ? (O/N)"
  continuer = gets.chomp
  
  if (continuer != "n" && continuer != "N") then
  
    # puts "#{Player.nbr_players} joueurs :"
    joueurs[0].display
    joueurs[1].display
    puts " "
    
    board = Board.new
    board.display
  
    i=0
    j=0
  
    while !board.check_win do
      # c'est ici que l'on pourrait ajouter la condition qui refait jouer le meme joueur si il a fait un mouvement NOK
      # genre en faisant :
      # jeu = joueur[i].play  << ["choix", "symbol"]
      # check_move(jeu)  << fonction qui teste les conditions pour valider le jeu, sinon retour à joueur[i].play
      # board.update(jeu) << board doit prendre un Array en param
      board.update(joueurs[i].play-1, joueurs[i].symbol)
      board.display
      j = i
      i == 0 ? i = 1 : i = 0  
    end
  
    if board.check_win
      puts "#{joueurs[j].name} wins"
      joueurs[j].score_point
    end
  
  else 
    puts "Partie terminée"
    joueurs[0].display
    joueurs[1].display
    new_game = 0
  end  
end
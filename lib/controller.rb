['board.rb', 'bishop.rb', 'king.rb', 'knight.rb', 'pawn.rb', 'queen.rb', 'rook.rb'].each do |file|
  require "./#{file}"
end
class Controller

  attr_reader  :player_name, :turn_color

  def initialize(name1, name2)
    @player_cycle = [name1, name2].cycle
    @turn_cycle = [:white, :black].cycle
    @all_pieces = starting_positions
    change_turn unless name1 == 'debug'
  end

  def starting_positions
    white_pawns = Array.new(8){ |i| Pawn.new(:white, i, 1) }
    black_pawns = Array.new(8){ |i| Pawn.new(:black, i, 6) }
    rooks = [Rook.new(:white, 0, 0), Rook.new(:white, 7, 0),
      Rook.new(:black, 0, 7), Rook.new(:black, 7, 7) ]
    knights = [Knight.new(:white, 1, 0), Knight.new(:white, 6, 0),
      Knight.new(:black, 1, 7), Knight.new(:black, 6, 7) ]
    bishops = [Bishop.new(:white, 2, 0), Bishop.new(:white, 5, 0),
      Bishop.new(:black, 2, 7), Bishop.new(:black, 5, 7) ]
    queens = [Queen.new(:white, 3, 0), Queen.new(:black, 3, 7) ]
    kings = [King.new(:white, 4, 0), King.new(:black, 4, 7) ]
    white_pawns + black_pawns + rooks + knights + bishops + queens + kings
  end

  def change_turn
    @turn_color = @turn_cycle.next
    @player_name = @player_cycle.next
    @all_pieces.select!{ |piece| piece.active? }
    Board.new(@all_pieces, @player_name).display
    get_move_input
  end

  def all_positions
    @all_pieces.map(&:position)
  end

  def piece_at( coord )
    @all_pieces.detect{ | piece | piece.position == coord }
  end

  def get_move_input
    puts "Enter your desired move"
    input = gets.chomp
    coords = input.partition('->') - ['->']
    coords.map!(&:strip)

    if coords.all?{ | coord | coord.match( /[a-h][1-8]/ ) }
      coords = clean_coords(*coords)
      get_move_type(*coords)
    else
      puts "Invalid move!  Try again"
      get_move_input
    end
  end

  def get_move_type(start, destination)
    if piece_at( start ).color == @turn_color  # and piece_at( destination ).color != @turn_color  commented out because if piece is empty then it's a nil error.  move this logic somewhere else
      if all_positions.include?( start )
        move_type =  all_positions.include?(destination) ? 'attack' : 'move' 
        attempt_move( start, destination, move_type )
      else
        puts "No piece at #{start}, please try again"
        get_move_input
      end
    else
      puts "You can't move a piece that isn't yours! Try again."
      get_move_input
    end
  end

  def attempt_move( start, destination, move_type )
    move_piece = piece_at( start )
    valid_coords = move_piece.send('valid_' + move_type + '_coords')

    if valid_coords.include?( destination )
      path = move_piece.path_to( destination ) 
      
      if (path & all_positions).empty?
        piece_at( destination ).kill  if move_type == 'attack'
        move_piece.file = destination[0]
	move_piece.rank = destination[1]
	change_turn
      else
        puts "Selected move is invalid - a piece is in the way.  Please try again"
	get_move_input 
      end
    else
      puts "Selected piece cannot move there! Please try again"
      get_move_input
    end
  end

  def clean_coords( pair1, pair2 )
    array = Array.new
    array << [ pair1[0].to_i(36)-10, pair1[1].to_i-1 ]
    array << [ pair2[0].to_i(36)-10, pair2[1].to_i-1 ]
  end
end


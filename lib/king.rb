require_relative 'game_piece.rb'

class King < GamePiece

  def piece_initial
    'K'
  end

  def path_to( target_coordinate )
    [[]]
#   or Array.new(1, []).  which is more readable?
  end   


  def valid_move_coords
    coords = Array.new

    coords << [   file  , rank + 1 ]
    coords << [   file  , rank - 1 ]
    coords << [ file + 1,   rank   ]
    coords << [ file - 1,   rank   ]
    coords << [ file + 1, rank + 1 ]
    coords << [ file - 1, rank + 1 ]
    coords << [ file + 1, rank - 1 ]
    coords << [ file - 1, rank - 1 ]

    coords.select do | file, rank |  #bad naming convention?
      (0..7).include?(file) and (0..7).include?(rank)
    end


  end

  alias :valid_attack_coords :valid_move_coords


end

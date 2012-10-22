require_relative 'game_piece'

class Knight < GamePiece

  def piece_initial
    'N'
  end

  def valid_move_coords
    coords = []
    change_vector = [ [2, 1], [2, -1], [1, -2,], [1, 2] ]

    change_vector.each do | f, r |
      coords << [file + f, rank + r]
      coords << [file - f, rank - r]
    end

    coords.select do | file, rank |
      (0..7).include?(file) and (0..7).include?(rank)
    end
  end

  alias :valid_attack_coords :valid_move_coords


  def path_to( target_coordinate )
    [[]]
  end

end

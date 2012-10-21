require './game_piece.rb'

class Rook < GamePiece

  def piece_initial
    'R'
  end

  def valid_move_coords
    coords = []
    0.upto(7) do | i |
      coords << [file, i]
      coords << [i, rank]
    end
    coords.uniq - [position]
  end

  alias :valid_attack_coords :valid_move_coords

  def path_to(target_coordinate)
    target_file, target_rank = *target_coordinate
    path_array = []

    if file == target_file
      (rank+1).upto(target_rank-1) do |current_rank|
        path_array << [file, current_rank]
      end
    elsif rank = target_rank
      (file+1).upto(target_file-1) do |current_file|
        path_array << [current_file, rank]
      end
    end
   path_array 
  end
end

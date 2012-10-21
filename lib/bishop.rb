require './game_piece.rb'

class Bishop < GamePiece

  def piece_initial
    'B'
  end

  def valid_move_coords
    coords = Array.new
    
    (1..7).each do | i |
      coords << [file+i, rank+i]
      coords << [file-i, rank-i]
      coords << [file+i, rank-i]
      coords << [file-i, rank+i]
    end

    coords.select do |file, rank|
      (0..7).include?(file) and (0..7).include?(rank)
    end   
  end

  alias :valid_attack_coords :valid_move_coords

  def path_to( target_coordinate )
    target_file, target_rank = *target_coordinate
    path_array = Array.new

    number_of_squares = ( target_file - file).abs
    rank_slope = target_rank  <=> rank
    file_slope = target_file <=> file

    (1..number_of_squares).each do | i |
      path_array << [ file + i*file_slope , rank + i*rank_slope ]
    end

    path_array -= [target_coordinate]
    path_array << [] if path_array.size == 0
    path_array
  end
end

require './game_piece.rb'

class Pawn < GamePiece

  def piece_initial
    'P'
  end

  def valid_attack_coords
    new_rank = ( color == :white ? rank + 1 : rank - 1 )
    coords = [ [file-1, new_rank], [file+1, new_rank] ]
    coords.select do |file, rank|
      (0..7).include?(file) and (0..7).include?(rank)
    end   
  end

  def valid_move_coords
    new_rank = ( color == :white ? rank + 1 : rank - 1 )   
    coords = [[file, new_rank]]
    coords.select do |file, rank|
      (0..7).include?(file) and (0..7).include?(rank)
    end   
  end

  def path_to(coordinate) #move to template?
    [[]]
  end

end


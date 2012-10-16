require 'game_piece.rb'
#Classes for individual pieces

class Pawn < GamePiece
  #movement algorithm (given two coords is the move valid?
    #opposite if black
    #check for pieces in the way
    #check that color aren't the same
    #change rank and file of piece
  def piece_initial
    'P'
  end



  def initials
    color_initial + piece_initial
  end

  def valid_coords
    if color == :white
      new_rank = rank + 1
    else
      new_rank = rank - 1
    end
    [ [file - 1, new_rank], [file, new_rank], [file + 1, new_rank] ]
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

end

=begin
King = K
Queen = Q
Knight = N
Rook = R
Bishop = B
Pawn = P
=end

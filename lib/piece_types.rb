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
    [ [file - 1, new_rank, ], [file, new_rank], [file + 1, new_rank] ]
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

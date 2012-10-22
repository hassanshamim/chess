class Board

  def initialize( pieces_array, player_name )
    @matrix = Array.new(64, '    ').each_slice(8).to_a
    populate( pieces_array )
    @name = player_name
  end
  
  def a
    @matrix[0]
  end

  def populate(array_of_pieces)
    array_of_pieces.each do | piece |
      @matrix[piece.file][piece.rank] = piece.initials.center(4)
    end
  end

  def display
    display_matrix = @matrix.transpose.reverse
    puts "#{@name}'s turn".rjust(22)
    sep_line = "   -----------------------------------------"
    puts sep_line
    puts "8  |" + display_matrix[0].join('|') + "|"
    puts sep_line
    puts "7  |" + display_matrix[1].join('|') + "|"
    puts sep_line
    puts "6  |" + display_matrix[2].join('|') + "|"
    puts sep_line
    puts "5  |" + display_matrix[3].join('|') + "|"
    puts sep_line
    puts "4  |" + display_matrix[4].join('|') + "|"
    puts sep_line
    puts "3  |" + display_matrix[5].join('|') + "|"
    puts sep_line
    puts "2  |" + display_matrix[6].join('|') + "|"
    puts sep_line
    puts "1  |" + display_matrix[7].join('|') + "|"
    puts sep_line
    puts "     A    B    C    D    E    F    G    H"
    puts "\n\n\n"
    ascii =
%Q{
   -----------------------------------------
8  | BR | BN | BB | BQ | BK | BB | BN | BR |
   -----------------------------------------
7  | BP | BP | BP | BP | BP | BP | BP | BP |
   -----------------------------------------
6  |    |    |    |    |    |    |    |    |
   -----------------------------------------
5  |    |    |    |    |    |    |    |    |
   -----------------------------------------
4  |    |    |    |    |    |    |    |    |
   -----------------------------------------
3  |    |    |    |    |    |    |    |    |
   -----------------------------------------
2  | WP | WP | WP | WP | WP | WP | WP | WP |
   -----------------------------------------
1  | WR | WN | WB | WQ | WK | WB | WN | WR |
   -----------------------------------------
     A    B    C    D    E    F    G    H
}
  end
end

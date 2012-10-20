require 'test/unit'
require 'queen.rb'

class QueenTest < Test::Unit::TestCase

  def test_01_queen_inherits_gamepiece_initializiation
    queen = Queen.new( :black, 2, 1 )

    assert_equal :black , queen.color
    assert_equal 2, queen.file
    assert_equal 1, queen.rank
    assert queen.active?
  end

  def test_02a_Queen_initial_returns_a_string
    queen = Queen.new( :black, 2, 1 )   
    
    queen_initial = queen.piece_initial
    
    assert queen_initial.is_a? String
  end

  def test_02b_Queen_initial_is_Q
    queen = Queen.new( :black, 2, 1 )   
    queen_initial = queen.piece_initial

    assert_equal 'Q', queen_initial
  end

  def test_03_Queen_initials_return_color_and_piece_initials
    b = Queen.new( :black, 2, 1 ).initials
    w = Queen.new( :white, 1, 1 ).initials

    assert_equal "BQ", b
    assert_equal "WQ", w
  end

  def test_5a_valid_move_coords_is_2d_array
    queen = Queen.new( :black, 1, 1)

    coords = queen.valid_move_coords

    assert_equal Array , coords.class
    assert_equal Array, coords.first.class
  end

  def test_5b_valid_move_coords_returns_27_coords_max
    queen = Queen.new( :black, 3, 3)
    coords = queen.valid_move_coords

    assert  coords.size <= 27
  end

  def test_5c_valid_move_coords_doesnt_include_starting_position
    queen = Queen.new( :black, 2, 2)
    coords = queen.valid_move_coords

    assert_equal false, coords.include?(queen.position)
  end

  def test_5d_valid_move_coords_doesnt_go_off_board
    queen = Queen.new( :white, 1, 1)
    coords = queen.valid_move_coords.sort
    expected = *(0..7)

    assert_equal expected, coords.flatten.uniq.sort
  end

  def test_6_valid_move_coords_is_valid_attack_coords
    queen = Queen.new( :white, 3, 3 )
    move_coords = queen.valid_move_coords
    attack_coords = queen.valid_attack_coords

    assert_equal move_coords, attack_coords
  end


  def test_7a_path_to_returns_2d_array
    queen = Queen.new( :white, 3, 3 )
    destination = [1, 4]
    path = queen.path_to( destination )

    assert_equal Array, path.class
    assert_equal Array, path.first.class
  end

  def test_7b_path_to_returns_proper_path
    queen = Queen.new( :white, 2, 0 )
    destination = [ 5, 3 ]
    path = queen.path_to( destination ).sort

    assert_equal [[3,1], [4, 2]], path
  end

  def test_7c_path_to_does_not_include_destination
    queen = Queen.new( :white, 3, 3 )
    destination = [1, 4]
    path = queen.path_to( destination )

    assert_equal  false, path.include?( destination )
  end

  def test_7d_path_is_empty_if_adjacent
    queen = Queen.new( :white, 3, 3 )
    destination = [4, 3]
    path = queen.path_to( destination )

    assert_equal [ [] ], path
  end
end

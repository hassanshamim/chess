require 'test/unit'
require 'king.rb'

class KingTest < Test::Unit::TestCase

  def test_01_king_inherits_gamepiece_initializiation
    king = King.new( :black, 2, 1 )

    assert_equal :black , king.color
    assert_equal 2, king.file
    assert_equal 1, king.rank
    assert king.active?
  end

  def test_02a_King_piece_initial_returns_a_string
    king = King.new( :black, 2, 1 )   
    king_initial = king.piece_initial
    
    assert king_initial.is_a? String
  end

  def test_02b_King_piece_initial_is_K
    king = King.new( :black, 2, 1 )   
    king_initial = king.piece_initial

    assert_equal 'K', king_initial
  end

  def test_03_King_initials_return_color_and_piece_initials
    b = King.new( :black, 2, 1 ).initials
    w = King.new( :white, 1, 1 ).initials

    assert_equal "BK", b
    assert_equal "WK", w
  end

  def test_4a_valid_move_coords_is_2d_array
    king = King.new(:black, 3, 3)
    coords = king.valid_move_coords

    assert_equal Array, coords.class
    assert_equal Array, coords.first.class
  end

  def test_4b_valid_move_coords_subarrays_all_have_2_items
    king = King.new(:black, 3, 3)
    coords = king.valid_move_coords

    assert_equal 2, coords.transpose.size
  end

  def test_5a_valid_move_coords
    king = King.new( :white, 5, 4 )
    coords = king.valid_move_coords.sort
    expected = [ [4, 3], [4, 4], [4, 5], [5, 3],
                 [5, 5], [6, 3], [6, 4], [6, 5] ]

    assert_equal expected, coords
  end


  def test_5b_valid_move_coords_edges
    king = King.new( :white, 0, 0 )
    coords = king.valid_move_coords.sort
    expected = [ [0, 1], [1, 0], [1, 1] ]

    assert_equal expected, coords
  end

  def test_6_valid_move_coords_is_valid_attack_coords
    king = King.new( :white, 3, 3)
    attack_coords = king.valid_attack_coords
    move_coords = king.valid_move_coords

    assert_equal move_coords, attack_coords
  end

  def test_7_path_to_returns_empty_2d_array
    king = King.new( :white, 3, 3 )

    assert_equal [[]], king.path_to([4,4])
  end
end

require 'test/unit'
require 'pawn.rb'

class PawnTest < Test::Unit::TestCase

  def test_01_pawn_inherits_gamepiece_initializiation
    p = Pawn.new( :black, 2, 1 )

    assert_equal :black , p.color
    assert_equal 2, p.file
    assert_equal 1, p.rank
    assert p.active?

  end

  def test_02a_PAWN_piece_initial_returns_a_string
    p = Pawn.new( :black, 2, 1 )   
    
    pawn_initial = p.piece_initial
    
    assert pawn_initial.is_a? String
  end

  def test_02b_PAWN_piece_initial_is_P
    p = Pawn.new( :black, 2, 1 )   

    pawn_initial = p.piece_initial
    assert_equal 'P', pawn_initial
  end

  def test_03_PAWN_initials_return_color_and_piece_initials
    b = Pawn.new( :black, 2, 1 ).initials
    w = Pawn.new( :white, 1, 1 ).initials

    assert_equal "BP", b
    assert_equal "WP", w
  end

  def test_5a_valid_attack_coords_black_regular
    b = Pawn.new( :black, 3, 3 )
    coords = b.valid_attack_coords

    assert coords.include?([2, 2])
    assert coords.include?([4, 2])
  end

  def test_5b_valid_attack_coords_white_regular
    b = Pawn.new( :white, 3, 3 )
    coords = b.valid_attack_coords

    assert coords.include?( [2, 4] )
    assert coords.include?( [4, 4] )
  end

  def test_5c_valid_attack_coords_edges
    a = Pawn.new( :white, 0, 3 )
    b = Pawn.new( :white, 7, 3 )
    coords1 = a.valid_attack_coords
    coords2 = b.valid_attack_coords

    assert_equal false, coords1.include?([-1, 4])
    assert_equal false, coords2.include?([8, 4])
  end

  def test_6_valid_move_coords_white
    a = Pawn.new( :white, 3, 3 )
    coords = a.valid_move_coords

    assert_equal 1, coords.size
    assert coords.include?([3, 4])
  end

  def test_6b_valid_move_coords_black
    a = Pawn.new( :black, 3, 3 )
    coords = a.valid_move_coords

    assert_equal 1, coords.size
    assert coords.include?([3, 2])
  end

  def test_6c_valid_move_coords_edges
    a = Pawn.new( :white, 3, 7 )
    b = Pawn.new( :black, 3, 0 )
    coords1 = a.valid_attack_coords
    coords2 = b.valid_attack_coords

    assert_equal false, coords1.include?([3, 8])
    assert_equal false, coords2.include?([3, -1])
  end

  def test_7_path_to_returns_empty_2d_array
    a = Pawn.new( :white, 3, 3 )

    assert_equal [[]], a.path_to([4,4])
  end
end

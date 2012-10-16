require 'test/unit'
require 'piece_types.rb'

class PieceTypeTest < Test::Unit::TestCase

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
  
  def test_4a_PAWN_valid_coords_produces_array_of_coords
    p = Pawn.new( :white, 2, 1 )
    coords = p.valid_coords
    first_coord = coords.first
    assert coords.is_a? Array
    assert first_coord.size == 2 and first_coord.is_a? Array

  end

  def test_4b_PAWN_valid_coords_produces_possible_move_coordinates_WHITE
    w = Pawn.new( :white, 2, 1 )
    coords = w.valid_coords  #order unimportant

    assert_equal true, coords.include?([1, 2])
    assert coords.include?([2, 2])
    assert coords.include?([3, 2])
  end

  def test_4c_PAWN_valid_coords_produces_possible_move_coordinates_BLACK
    b = Pawn.new( :black, 3, 3 )
    coords = b.valid_coords

    assert coords.include?([2, 2])
    assert coords.include?([3, 2])
    assert coords.include?([4, 2])

  end
end

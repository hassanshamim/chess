require 'test/unit'
require 'rook.rb'

class RookTest < Test::Unit::TestCase

  def test_01_rook_inherits_gamepiece_initializiation
    p = Rook.new( :black, 2, 1 )

    assert_equal :black , p.color
    assert_equal 2, p.file
    assert_equal 1, p.rank
    assert p.active?
  end

  def test_02a_Rook_initial_returns_a_string
    p = Rook.new( :black, 2, 1 )   
    
    rook_initial = p.piece_initial
    
    assert rook_initial.is_a? String
  end

  def test_02b_Rook_initial_is_R
    p = Rook.new( :black, 2, 1 )   

    rook_initial = p.piece_initial
    assert_equal 'R', rook_initial
  end

  def test_03_Rook_initials_return_color_and_piece_initials
    b = Rook.new( :black, 2, 1 ).initials
    w = Rook.new( :white, 1, 1 ).initials

    assert_equal "BR", b
    assert_equal "WR", w
  end

  def test_5a_valid_move_coords_is_2d_array
    r = Rook.new( :black, 1, 1)

    coords = r.valid_move_coords

    assert_equal Array , coords.class
    assert_equal Array, coords.first.class
  end

  def test_5b_valid_move_coords_has_14_coords
    r = Rook.new( :black, 1, 1)
    num_coords = r.valid_move_coords.size

    assert_equal 14, num_coords
  end

  def test_5c_valid_move_coords_doesnt_include_starting_position
    r = Rook.new( :black, 1, 1)
    coords = r.valid_move_coords

    assert_equal false, coords.include?(r.position)
  end

  def test_6_valid_move_coords_is_valid_attack_coords
    a = Rook.new( :white, 3, 3 )
    move_coords = a.valid_move_coords
    attack_coords = a.valid_attack_coords
    assert_equal move_coords, attack_coords
  end


  def test_7a_path_to_returns_2d_array
    rook = Rook.new( :white, 3, 3 )
    destination = [7, 3]
    path = rook.path_to( destination )
    assert_equal Array , path.class
    assert_equal Array, path.first.class
  end

  def test_7b_path_to_returns_correct_path_same_file
    rook = Rook.new( :white, 0, 0 )
    result = rook.path_to([0, 7]).sort!
    expected = [ [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6] ]

    assert_equal expected, result
  end

end

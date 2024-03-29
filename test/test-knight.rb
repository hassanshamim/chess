require 'test/unit'
require 'knight.rb'

class KnightTest < Test::Unit::TestCase

  def test_01_knight_inherits_gamepiece_initializiation
    knight = Knight.new( :black, 2, 1 )

    assert_equal :black , knight.color
    assert_equal 2, knight.file
    assert_equal 1, knight.rank
    assert knight.active?
  end

  def test_02a_Knight_initial_returns_a_string
    knight = Knight.new( :black, 2, 1 )   
    
    knight_initial = knight.piece_initial
    
    assert knight_initial.is_a? String
  end

  def test_02b_Knight_initial_is_N
    knight = Knight.new( :black, 2, 1 )   

    knight_initial = knight.piece_initial
    assert_equal 'N', knight_initial
  end

  def test_03_Knight_initials_return_color_and_piece_initials
    b = Knight.new( :black, 2, 1 ).initials
    w = Knight.new( :white, 1, 1 ).initials

    assert_equal "BN", b
    assert_equal "WN", w
  end

  def test_5a_valid_move_coords_is_2d_array
    knight = Knight.new( :black, 1, 1)

    coords = knight.valid_move_coords

    assert_equal Array , coords.class
    assert_equal Array, coords.first.class
  end

  def test_5b_valid_move_coords_returns_8_coords_max
    knight = Knight.new( :black, 3, 3)
    coords = knight.valid_move_coords

    assert_equal 8,  coords.size
  end

  def test_5c_valid_move_coords_doesnt_include_starting_position
    knight = Knight.new( :black, 2, 2)
    coords = knight.valid_move_coords

    assert_equal false, coords.include?(knight.position)
  end

  def test_5d_valid_move_coords_doesnt_go_off_board
    knight = Knight.new( :white, 1, 1)
    coords = knight.valid_move_coords.sort
    expected = [ [0,3], [2,3], [3,0], [3,2] ]

    assert_equal expected, coords
  end

  def test_6_valid_move_coords_is_valid_attack_coords
    knight = Knight.new( :white, 3, 3 )
    move_coords = knight.valid_move_coords
    attack_coords = knight.valid_attack_coords

    assert_equal move_coords, attack_coords
  end


  def test_7a_path_to_returns_2d_array
    knight = Knight.new( :white, 3, 3 )
    destination = [1, 4]
    path = knight.path_to( destination )

    assert_equal Array, path.class
    assert_equal Array, path.first.class
  end

  def test_7b_path_to_returns_empty_2d_array
    knight = Knight.new( :white, 2, 0 )
    destination = [ 3, 2 ]
    path = knight.path_to( destination )

    assert_equal [[]], path
  end


end

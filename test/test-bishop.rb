require 'test/unit'
require 'bishop.rb'

class BishopTest < Test::Unit::TestCase

  def test_01_bishop_inherits_gamepiece_initializiation
    p = Bishop.new( :black, 2, 1 )

    assert_equal :black , p.color
    assert_equal 2, p.file
    assert_equal 1, p.rank
    assert p.active?
  end

  def test_02a_Bishop_initial_returns_a_string
    p = Bishop.new( :black, 2, 1 )   
    
    bishop_initial = p.piece_initial
    
    assert bishop_initial.is_a? String
  end

  def test_02b_Bishop_initial_is_R
    p = Bishop.new( :black, 2, 1 )   

    bishop_initial = p.piece_initial
    assert_equal 'B', bishop_initial
  end

  def test_03_Bishop_initials_return_color_and_piece_initials
    b = Bishop.new( :black, 2, 1 ).initials
    w = Bishop.new( :white, 1, 1 ).initials

    assert_equal "BB", b
    assert_equal "WB", w
  end

  def test_5a_valid_move_coords_is_2d_array
    r = Bishop.new( :black, 1, 1)

    coords = r.valid_move_coords

    assert_equal Array , coords.class
    assert_equal Array, coords.first.class
  end

  def test_5b_valid_move_coords_is_diagonal_from_start
    r = Bishop.new( :black, 4, 4)
    coords = r.valid_move_coords
    rank = r.rank
    file = r.file
    filtered_coords = coords.select do | f, r|
      (file-f).abs == (rank-r).abs
    end

    assert_equal coords.sort, filtered_coords.sort

  end

  def test_5c_valid_move_coords_doesnt_include_starting_position
    r = Bishop.new( :black, 1, 1)
    coords = r.valid_move_coords

    assert_equal false, coords.include?(r.position)
  end

  def test_6_valid_move_coords_is_valid_attack_coords
    a = Bishop.new( :white, 3, 3 )
    move_coords = a.valid_move_coords
    attack_coords = a.valid_attack_coords
    assert_equal move_coords, attack_coords
  end


  def test_7a_path_to_returns_2d_array
    bishop = Bishop.new( :white, 3, 3 )
    destination = [7, 7]
    path = bishop.path_to( destination )

    assert_equal Array, path.class
    assert_equal Array, path.first.class
  end

  def test_7b_path_to_does_not_include_target_location
    bishop = Bishop.new( :white, 2, 0 )
    destination = [ 7, 5 ]
    path = bishop.path_to( destination )

    assert_equal false, path.include?( destination )
  end

  def test_7c_path_to_returns_correct_path_same_file
    bishop = Bishop.new( :white, 0, 0 )
    result = bishop.path_to([7, 7]).sort!
    expected = [ [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6] ]

    assert_equal expected, result
  end

  def test_7c_path_to_return_empty_2d_array_if_adjacent
    bishop = Bishop.new( :white, 3, 3 )
    destination = [ 2, 4 ]
    path = bishop.path_to( destination )

    assert_equal [ [] ], path

  end

end

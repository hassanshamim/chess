require 'game_piece'
require 'test/unit'


class GamePieceTest < Test::Unit::TestCase

  def test_01a_game_piece_color_is_a_symbol
    b = GamePiece.new( :black, 0, 0 )
  
    assert_equal b.color.class, Symbol
  end
   
  def test_01b_game_piece_has_color
    b = GamePiece.new( :black, 0, 0 )
    w = GamePiece.new( :white, 0, 0 )

    assert_equal b.color, :black
    assert_equal w.color, :white
  end

  def test_02_game_piece_has_an_integer_file
    p = GamePiece.new( :black, 4, 0 )

    assert p.file.is_a? Integer
  end

  def test_02b_game_piece_has_integer_rank
    p = GamePiece.new( :black, 4, 8 )

    assert p.rank.is_a? Integer
  end

  def test_03a_game_piece_file_can_be_changed
    p = GamePiece.new( :black, 4, 0 )

    original_file = p.file
    p.file = 7
    new_file = p.file

    assert_equal 4, original_file
    assert_equal 7, new_file
  end

  def test_03b_game_piece_rank_can_be_changed
    p = GamePiece.new( :black, 4, 0 )

    original_rank = p.rank
    p.rank = 5
    new_rank = p.rank

    assert_equal 0, original_rank
    assert_equal 5, new_rank
  end

  def test_04_position_return_rank_and_file

    p = GamePiece.new( :white, 2, 5 )
    position1 = p.position

    p.rank = 3
    p.file = 3
    position2 = p.position

    assert_equal [2,5], position1
    assert_equal [3,3], position2

  end

 def test_05a_game_piece_is_active_when_created
    p = GamePiece.new( :white, 2, 5 )

    assert  p.active?
  end
 
  def test_05b_after_kill_active_returns_false
    p = GamePiece.new( :white, 2, 5 )
    r = GamePiece.new( :white, 2, 5 )
    p.kill
    r.seppuku
    
    assert_equal false, p.active?
    assert_equal false, p.active?
  end

  def test_05c_after_kill_rank_and_file_are_nil
    p = GamePiece.new( :white, 2, 5 )

    p.kill
    assert_equal nil, p.file
    assert_equal nil, p.rank
    assert_equal [nil, nil], p.position
  end

  def test_06a_color_intial_returns_a_string
    p = GamePiece.new( :white, 2, 5 )
    ci = p.color_initial
    assert ci.is_a? String
  end

  def test_06b_color_initial_returns_first_letter
    w = GamePiece.new( :white, 2, 5 )
    b = GamePiece.new( :black, 2, 5 )

    assert_equal 'W', w.color_initial
    assert_equal 'B', b.color_initial
  end

  def test_07_new_pieces_get_added_to_all_pieces
    w = GamePiece.new( :white, 2, 5 )
    b = GamePiece.new( :black, 2, 5 )
    last = GamePiece.new( :white, 1, 1)
    result = GamePiece.class_variable_get(:@@all_pieces).size

    assert_equal 18, result
  end
end

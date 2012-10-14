require 'simplecov'
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
end

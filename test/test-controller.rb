require 'controller.rb'
require 'test/unit'

class ControllerTest < Test::Unit::TestCase

  def test_01_contoller_new_takes_only_two_arguments
  
    assert_raise(ArgumentError) do
      Controller.new('one variable')
    end

    assert_raise(ArgumentError) do
      Controller.new('var1', 'var2', 'var3')
    end

    assert_nothing_raised do
      Controller.new("var1", "var2")
    end
  end

  def test_02a_turn_color_is_a_symbol
    controller = Controller.new("Magnus", "DeepBlue")
    color1 = controller.turn_color
    color2 = controller.change_turn.turn_color

    assert_equal Symbol, color1.class
    assert_equal Symbol, color2.class
  end

  def test_02b_turn_color_starts_as_white
    controller = Controller.new("Magnus", "DeepBlue")

    assert_equal :white, controller.turn_color
  end

  def test_02c_turn_color_cycles_between_black_and_white
    controller = Controller.new("Magnus", "DeepBlue")
    controller.change_turn
    turn2 = controller.turn_color
    controller.change_turn
    turn3 = controller.turn_color

    assert_equal :black, turn2
    assert_equal :white, turn3
  end

  def test_03a_player_name_is_a_string
    controller = Controller.new("Magnus", "DeepBlue")
    name1 = controller.player_name
    controller.change_turn
    name2 = controller.player_name

    assert_equal String, name1.class
    assert_equal String, name2.class
  end

  def test_03b_player_name_starts_as_first_argument
    controller = Controller.new("Magnus", "DeepBlue")

    assert_equal 'Magnus', controller.player_name
  end

  def test_03c_player_name_cycles_between_the_two_args
    controller = Controller.new("Magnus", "DeepBlue")
    controller.change_turn
    turn2 = controller.player_name
    controller.change_turn
    turn3 = controller.player_name

    assert_equal 'DeepBlue', turn2
    assert_equal 'Magnus', turn3
  end

  def test_04_controller_can_change_turn_many_many_times
    controller = Controller.new("Magnus", "DeepBlue")

    assert_nothing_raised do
      1000.times{controller.change_turn}
    end
  end

  def test_05a_all_pieces_is_an_array
    controller = Controller.new("Magnus", "DeepBlue")
    all_pieces = controller.instance_variable_get(:@all_pieces)

    assert_equal Array, all_pieces.class
  end

  def test_05b_all_pieces_contains_32_pieces_to_start
    controller = Controller.new("Magnus", "DeepBlue")
    all_pieces = controller.instance_variable_get(:@all_pieces)

    assert_equal 32, all_pieces.size
    all_pieces.each{|piece| puts "#{piece.class}, #{piece.position}"} 
  end

  def test_05c_all_pieces_contains_only_game_pieces
    controller = Controller.new("Magnus", "DeepBlue")
    all_pieces = controller.instance_variable_get(:@all_pieces)

    assert all_pieces.all?{ | piece | piece.is_a?(GamePiece) }
  end

  def test_05d_all_pieces_contains_right_number_of_each_piece
    controller = Controller.new("Magnus", "DeepBlue")
    all_pieces = controller.instance_variable_get(:@all_pieces)

    num_pawns = all_pieces.count{ |piece| piece.class = Pawn }
    num_rooks = all_pieces.count{ |piece| piece.class = Rook }
    num_knights = all_pieces.count{ |piece| piece.class = Knight }
    num_bishops = all_pieces.count{ |piece| piece.class = Bishop }
    num_queens = all_pieces.count{ |piece| piece.class = Queen }
    num_kings = all_pieces.count{ |piece| piece.class = King }

    assert_equal 16, num_pawns
    assert_equal 4, num_rooks
    assert_equal 4, num_knighs
    assert_equal 4, num_bishops
    assert_equal 2, num_queens
    assert_equal 2, num_kings
  end


end


shit to test when you have time:
  change_turn removes pieces that are inactive
  all_positions returns 2d array of all the pieces positions
  get_move_input
  clean_coords
  get_move_type

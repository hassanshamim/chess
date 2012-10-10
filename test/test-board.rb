require 'test/unit'
require 'board.rb'


class BoardTest < Test::Unit::TestCase

  def test_01_board_has_both_mailboxes
    m = Board.new
    
    assert_equal true, !!m.mailbox
    assert_equal true, !!m.mailbox64
  end

end

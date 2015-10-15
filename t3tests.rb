require "./t3randomai"
require "./theboard"
require "pry"
require "set"

require "minitest/autorun"

class BoardTests < Minitest::Test
  def setup
    @board = Board.new
    @pmove = 3
    @currentmarker = "X"
  end

  def test_board_updates
    testboard = @board.board
    testboard[@pmove-1] = @currentmarker
    assert testboard.include?(@currentmarker)
    refute testboard.include?(@pmove)
  end

  def test_win_at_start
    refute @board.win?
  end

  def test_gameover_at_start
    refute @board.gameover?
  end

  def test_validmove?
    assert @board.validmove?(@pmove)
    refute @board.validmove?("c")
    refute @board.validmove? ("chicken")
  end

end


class PlayerTests < Minitest::Test

 
  def test_name_sends_properly
    @player = RandomAI.new
    assert @player.name.class == String
  end

  def test_AI_makes_smart_move
    @player = RandomAI.new
    board = [1,2,3,"X", "O", 6]
    assert @player.get_move(board) != String
  end
end
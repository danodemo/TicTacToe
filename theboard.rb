#the board
require "pry"
require "set"

class Board

def initialize
  @winset = [
  [1,2,3], [1,4,7], [1,5,9], [2,5,8],
  [3,5,7], [3,6,9], [4,5,6], [7,8,9]]
  @board = (1..9).to_a
  @p1marker = "X"
  @p2marker = "O"
  @currentmarker = @p1marker
  @p1guesses = []
  @p2guesses = []
end

def showboard
  board = @board
  puts "  #{board[0]} | #{board[1]} | #{board[2]}
  #{board[3]} | #{board[4]} | #{board[5]}
  #{board[6]} | #{board[7]} | #{board[8]}
  "
end

def board
  @board
end

def currentmarker
  @currentmarker
end

def validmove?(pmove)
  if @board.include?(pmove)
    true
  else
    false
  end
end

def moves(pmove)
  #checks to see if move is valid
  if validmove?(pmove)
  #puts the correct marker where the player picks a square
  #shows the board
  #swaps the turn
  @board[pmove - 1] = @currentmarker
    if @currentmarker == @p1marker
      @p1guesses.push(pmove)
      @currentmarker = @p2marker
    else
      @p2guesses.push(pmove)
      @currentmarker = @p1marker
    end
  else
    puts
    puts "That is not a valid move, please pick again."
    puts
    sleep(2)
  end
end

def gameover?
  @p1guesses.length + @p2guesses.length == 9
end

def win?
  @winset.any? do |x|
    x.to_set.subset?(@p1guesses.to_set) || x.to_set.subset?(@p2guesses.to_set)
end
end

end
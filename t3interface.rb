#Ask Brit about which methods can be made private
#Where could refactoring happen?
#Fix flavor text and timing for better user interface
#Experiment with screen-clearing for prettier experience
#modify build game into its own class for integration into master

require "./t3human"
require "./theboard"
require "./t3randomai"
require "pry"
require "set"

@player1 = nil
@player2 = nil
@playBoard = nil
@currentplayer = nil

def greetings
   puts
  puts
  puts
  puts "Welcome to Tic-Tac-Toe, an exciting new game brought to you"
  puts "by the King of the Internet: may his reign last for all time!"
  puts "This game is meant for two human players.  If you want to play"
  puts "the AI, that's just too bad, for the King has forbidden it!"
  puts
  sleep(2)
end

def buildgame #this could easily be turned into its own class
  puts        #something to consider for future project
  puts "Player 1 will be represented by an X."
  @player1 = HumanPlayer.new
  puts "Player 2, you will be represented by an O.  Would you like a"
  puts "(1)Human Player or (2)Computer player?"
  gametype = gets.chomp.to_i
    if gametype == 1
      @player2 = HumanPlayer.new
    else
      @player2 = RandomAI.new
      sleep(1)
      puts "The AI you are playing against today is #{@player2.name}."
      puts
      sleep(1)
    end
  @playBoard = Board.new
end

def postmortem
    if @playBoard.currentmarker == "X"
      @currentplayer = @player1.name
    else
      @currentplayer = @player2.name
    end
  end

  def outcome #prompt for replay here? ask about calling t3game here
    name = @currentplayer
    if @playBoard.win?
      puts
      puts "Congratulations, #{name}, you have won the game!"
      puts
    else
      puts
      puts "It's a draw!  Nobody wins!  You guys suck!"
      puts
    end
  end

def t3game  #add 'replay' function/method?
  greetings
  buildgame
  puts "It is time for the game to begin.  Prepare yourselves!"
  puts
  sleep(1)
  @playBoard.showboard
  until @playBoard.win? || @playBoard.gameover?
    if @playBoard.currentmarker == "X"
      move = @player1.get_move(@playBoard.board)
      @playBoard.moves(move)
      @playBoard.showboard
    else
      move = @player2.get_move(@playBoard.board)
      @playBoard.moves(move)
      @playBoard.showboard
    end
  end
  postmortem
  outcome
end

t3game
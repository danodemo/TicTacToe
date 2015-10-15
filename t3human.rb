require "pry"
require "set"

class HumanPlayer

  def initialize
    puts "Please enter your name."
    name = gets.chomp
    @name = name
  end

  def name
    @name
  end

  def get_move(board)
    puts
    puts "#{name}, please choose a square!"
    move = gets.chomp.to_i
  end


end
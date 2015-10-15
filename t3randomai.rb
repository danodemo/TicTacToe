require "pry"
require "set"
require "./theboard"

class RandomAI

def initialize
  namebank = [
"Sam", "Bill", "Bart", "Brit", "Steve", "Jake the Snake Roberts",
"Wild Bill Hickock", "The Sandman", "Azmodan, Lord of Sin",
"Grizwald the Great", "Alan", "Mr Rogers", "Baron Von Großerschwanz",
"The King of the Internet", "Tim the Guard", "President Obama"
  ]
  @name = namebank.sample
end

def name
  @name
end

def get_move(board)
  movebank = board.reject {|i| i.class == String}
  puts
  puts "The AI, #{@name}, is about to make a move."
  puts
  sleep(1)
  guess = movebank.sample
  puts "#{name} says, 'I choose #{guess}.'"
  puts
  sleep(1)
  guess
end

end

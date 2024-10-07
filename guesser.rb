require './checks.rb'

class Guesser
  include Checks
  
  def initialize 
    @guess_string = ""
    @guess_array = []
  end 

  def get_guess
    puts "What is your guess?"
    gets.chomp
  end

  def format_guess(guess_string)
    @guess_array =  guess_string.split
  end
end
require './checks.rb'

class Guesser
  include Checks
  
  attr_reader :guess
  def initialize 
    @guess_string = ""
    @guess = []
  end 

  def get_guess
    puts "What is your guess?"
    gets.chomp
  end

  def format_guess(guess_string)
    @guess =  guess_string.upcase.split("")
  end

  def make_guess
    @guess_string = get_guess
    format_guess(@guess_string)
  end
end
require './checks.rb'
require './user_compliance.rb'

class Guesser
  include Checks
  include UserCompliance

  attr_reader :guess
  def initialize 
    @guess_string = ""
    @guess = []
  end 

  def get_guess
    guess = ""
    loop do
      puts "What is your guess?"
      guess = gets.chomp
      break unless code_format_issue?(guess)
    end
    guess
  end

  def format_guess(guess_string)
    @guess =  guess_string.upcase.split("")
  end

  def make_guess
    @guess_string = get_guess
    format_guess(@guess_string)
  end
end
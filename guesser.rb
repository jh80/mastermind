require './checks.rb'
require './user_compliance.rb'

class Guesser
  include Checks
  include UserCompliance

  attr_reader :guess
  def initialize 
    @guess_string = ""
    @guess = []
    @guesser = false
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

  def make_guess
    @guess_string = get_guess
    @guess = format_string(@guess_string)
  end
end
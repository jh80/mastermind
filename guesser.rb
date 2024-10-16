require './checks.rb'
require './user_compliance.rb'
require './inputable'
require './computer_intelligence'

class Guesser
  include Checks
  include UserCompliance
  include Inputable
  include ComputerIntelligence

  attr_reader :guess
  def initialize 
    @guess_string = ""
    @guess = []
    @guesser_type = false
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

  def set_guess
    @guess = @guesser_type == "human" ? format_string(get_guess) : generate_code(4) 
  end

  def set_guesser_type
    @guesser_type = get_player_type("Who will be guessing? Human or computer?")
  end
end

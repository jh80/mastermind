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

  def set_guess(world, round)
    if @guesser_type == "human" 
      @guess = format_string(get_guess)
    else 
      @guess = round == 0 ? generate_first_guess(world.all_colors) : generate_guess_from_viable_codes(world.viable_codes)
    end
  end

  def set_guesser_type
    @guesser_type = get_player_type("Who will be guessing? Human or computer?")
  end
end

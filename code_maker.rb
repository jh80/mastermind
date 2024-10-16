require "./checks.rb"
require './human_code_maker.rb'

class CodeMaker
  include Checks
  include HumanCodeMaker

  # TO DO take out: Just for testing
  attr_reader :code
  def initialize()
    @code_length = 4
    @code = []
    @code_maker_type = false
  end

  def generate_code
    code = []
    all_colors = ["R", "Y", "G", "U", "W", "B"]
    @code_length.times do
      code.push(all_colors.sample)
    end
    code
  end

  def choose_code_maker
    code_maker = "none"
    loop do
      puts "Who will make the code? Human or Computer?"
      code_maker = gets.chomp.downcase
      break unless !player_type_valid?(code_maker)
    end 
    code_maker
  end

  def set_code_maker_type
    @code_maker_type = choose_code_maker
  end

  def set_code
    set_code_maker_type
    @code = @code_maker_type == "computer" ? generate_code : get_human_code
  end
end
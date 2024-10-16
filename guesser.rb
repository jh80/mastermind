require './checks.rb'

class Guesser
  include Checks
  
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

  def all_chars_valid?(guess)
    all_colors = ["R", "Y", "G", "U", "W", "B"]
    all_chars_valid = true
    guess.upcase.each_char { |char| all_chars_valid = false unless all_colors.include?(char)}
    all_chars_valid
  end

  def code_format_issue?(guess)
    if !all_chars_valid?(guess)
      puts "The available letters to represent the colors are: R Y G U B W"
      return true
    elsif guess.length > 4
      puts "Your guess is too long, it should only be 4 characters. Remember not to use spaces."
      return true
    elsif guess.length < 4
      puts "Your guess is not longe enough, use 4 letters"
      return true
    end
    return false
  end
end
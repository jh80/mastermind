# frozen_string_literal: true

# This class holds and determines information on the guesser including the guess
require './checks'
require './user_compliance'
require './inputable'
require './computer_intelligence'

class Guesser
  include Checks
  include UserCompliance
  include Inputable
  include ComputerIntelligence

  attr_reader :guess, :guesser_difficulty

  def initialize
    @guess_string = ''
    @guess = []
    @guesser_type = false
    @guesser_difficulty = false
  end

  def get_guess
    guess = ''
    loop do
      puts 'What is your guess?'
      guess = gets.chomp
      break unless code_format_issue?(guess)
    end
    guess
  end

  def set_guess(round, world)
    @guess = if @guesser_type == 'human'
               format_string(get_guess)
             else
               computer_guess(@guesser_difficulty, round, world)
             end
  end

  def set_guesser_type
    @guesser_type = get_player_type('Who will be guessing? Human or computer?')
  end

  def set_guesser_difficulty
    return if @guesser_type == 'human'

    @guesser_difficulty = get_difficulty_level
  end

  def computer_guess(difficulty, round, world)
    if difficulty == 'hard'
      computer_guess_hard(round, world)
    else
      computer_guess_standard(round, world)
    end
  end
end

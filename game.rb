require './user_compliance'

class Game
  include UserCompliance

  attr_reader :code_maker

  def initialize
    @guesser = Guesser.new
    @code_maker = CodeMaker.new
    @rc_rp = 0
    @guess_max = 12
  end

  def give_instructions
    puts <<~RUBY
      Welcome to mastermind!
      In this game you will be asked to guess a 4 letter code 
      using the letters R Y G U B W. Letters may be repeated.
      Enter your guess with no spaces.
      
      After you enter your guess you will get back a "hint."
      The hint will be a combination of r's and w's. You will
      get an r for every correct letter in the correct place
      and a w for every correct letter in the wrong place. If
      you get a blank hint it means you have a no correct letters.

      Have fun!\n
    RUBY
  end

  def choose_code_maker
    code_maker = "none"
    loop do
      puts "Who will make the code? Human or Computer?"
      code_maker = gets.chomp.downcase
      break unless !code_maker_valid?(code_maker)
    end 
    code_maker
  end

  def play
    give_instructions
    code_maker.generate_code
    @guess_max.times do |round|
      if @rc_rp == @code_maker.code.length
        puts "Congratultions the code was #{@code_maker.code} and you guessed it!"
        break
      end
      @guesser.make_guess
      @rc_rp = @code_maker.evaluate_guess(@guesser.guess)
      puts "Sorry, you ran out of guesses" if round == @guess_max - 1
    end
  end
end
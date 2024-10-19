require './user_compliance'

class Game
  include UserCompliance

  attr_reader :code_maker, :real_world

  def initialize
    @guesser = Guesser.new
    @code_maker = CodeMaker.new
    @real_world = World.new
    @rc_rp = 0
    @guess_max = 10000
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

  def play
    give_instructions
    code_maker.set_code
    @guesser.set_guesser_type
    @guess_max.times do |round|
      if @rc_rp == @code_maker.code.length
        puts "Congratultions the code was #{@code_maker.code.join} and you guessed it in #{round} guesses!"
        break
      end
      @guesser.update_viable_codes(real_world) if round > 0
      guess = @guesser.set_guess(@real_world, round)
      print "guess: #{guess.join}  "
      results = @code_maker.evaluate_guess(@guesser.guess, @code_maker.code)
      @rc_rp = results[:rc_rp]
      @code_maker.print_hint(results[:rc_rp], results[:rc_wp])
      @real_world.add_rule(guess, results[:rc_rp], results[:rc_wp])
      @real_world.process_results(@real_world.rules[-1])
      puts "Sorry, you ran out of guesses" if round == @guess_max - 1
    end
  end
end
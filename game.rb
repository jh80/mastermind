class Game
  def initialize
    @guesser = Guesser.new
    @code_maker = CodeMaker.new
    @rc_rp = 0
    @guess_max = 12
  end

  def play
    # Code is created during initialization phase when code_maker instance is created
    @guess_max.times do 
      if @rc_rp == @code_maker.code.length
        puts "Congratultions the code was #{@code_maker.code} and you guessed it!"
        break
      end
      @guesser.make_guess
      @rc_rp = @code_maker.evaluate_guess(@guesser.guess)
    end
    puts "Sorry, you ran out of guesses"
  end
end
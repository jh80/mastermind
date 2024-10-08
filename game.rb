class Game
  def initialize
    @guesser = Guesser.new
    @code_maker = CodeMaker.new
    @rc_rp = 0
  end

  def play
    # Code is created during initialization phase when code_maker instance is created
    while @rc_rp != @code_maker.code.length
      @guesser.make_guess
      @rc_rp = @code_maker.evaluate_guess(@guesser.guess)
    end
    puts "Congratultions the code was #{@code_maker.code} and you guessed it!"
  end
end
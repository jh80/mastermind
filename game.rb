class Game
  attr_reader :code_maker

  def initialize
    @guesser = Guesser.new
    @code_maker = CodeMaker.new
    @rc_rp = 0
    @guess_max = 12
  end

  def play
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
require 'pry-byebug'
require './guesser.rb'
require './code_maker.rb'
require './checks.rb'
require './game.rb'
require './world.rb'


game = Game.new
real_world = World.new

game.play

# code_maker = game.code_maker.choose_code_maker
# guesser = Guesser.new()
# code_maker = CodeMaker.new()
# guesser.make_guess
# p guesser.guess
# code_maker.evaluate_guess(guesser.guess)

# p indexes = guesser.find_rc_rp_indexes(code, guess)
# filtered_code = guesser.remove_elements_by_indexes(code, indexes)
# p "Leftover code array #{filtered_code}"
# filtered_guess = guesser.remove_elements_by_indexes(guess, indexes)
# p "leftover guess array #{filtered_guess}"
# guesser.print_hint(guesser.calculate_rp_rc_count(guess, filtered_guess), guesser.count_rc_wp(filtered_code, filtered_guess))

# TO DO a possible start to reorganizing how the computer vs human features are called
# def play_computer_guesser
#   @guess_max.times do |round|
#     if @rc_rp == @code_maker.code.length
#       puts "Congratultions the code was #{@code_maker.code.join} and you guessed it in #{round} guesses!"
#       break
#     end
#     guess = @guesser.set_guess(@real_world, round)
#     print "guess: #{guess.join}  "
#     results = @code_maker.evaluate_guess(@guesser.guess, @code_maker.code)
#     @rc_rp = results[:rc_rp]
#     @code_maker.print_hint(results[:rc_rp], results[:rc_wp])
#     print "Options left: #{@real_world.viable_codes}\n\n"
#     puts "Sorry, you ran out of guesses" if round == @guess_max - 1
#   end
# end

# def play_human_guesser
#   @guess_max.times do |round|
#     if @rc_rp == @code_maker.code.length
#       puts "Congratultions the code was #{@code_maker.code.join} and you guessed it in #{round} guesses!"
#       break
#     end
#     guess = @guesser.set_guess(@real_world, round)
#     print "guess: #{guess.join}  "
#     results = @code_maker.evaluate_guess(@guesser.guess, @code_maker.code)
#     @rc_rp = results[:rc_rp]
#     @code_maker.print_hint(results[:rc_rp], results[:rc_wp])
#     print "Options left: #{@real_world.viable_codes}\n\n"
#     puts "Sorry, you ran out of guesses" if round == @guess_max - 1
#   end
# end
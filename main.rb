require 'pry-byebug'
require './guesser.rb'
require './code_maker.rb'
require './checks.rb'
require './game.rb'


game = Game.new

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


require './guesser.rb'

code = ["R", "U", "R", "W"]


guesser = Guesser.new()
guess_string = guesser.get_guess
guess_array = guesser.format_guess(guess_string)
p "Your guess is #{guess_array}"
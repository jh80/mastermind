# frozen_string_literal: true

require 'pry-byebug'
require './guesser'
require './code_maker'
require './checks'
require './game'
require './world'

game = Game.new

game.play

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

# frozen_string_literal: true

# This module allows for human input
module Inputable
  def get_player_type(request_message)
    player_type = 'none'
    loop do
      puts request_message
      player_type = gets.chomp.downcase
      break if player_type_valid?(player_type)
    end
    player_type
  end

  def get_difficulty_level
    difficulty = 'none'
    loop do
      puts 'What difficulty would you like? Hard or regular?'
      difficulty = gets.chomp.downcase
      break if difficulty_valid?(difficulty)
    end
    difficulty
  end
end

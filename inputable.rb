module Inputable
  def get_player_type(request_message)
    player_type = "none"
    loop do
      puts request_message
      player_type = gets.chomp.downcase
      break unless !player_type_valid?(player_type)
    end 
    player_type
  end
end
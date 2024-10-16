module Inputable
  def choose_player_type
    code_maker = "none"
    loop do
      puts "Who will make the code? Human or Computer?"
      code_maker = gets.chomp.downcase
      break unless !player_type_valid?(code_maker)
    end 
    code_maker
  end
end
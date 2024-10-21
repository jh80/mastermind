module UserCompliance
  def code_format_issue?(code, code_type = "guess")
    if !all_chars_valid?(code)
      puts "The available letters to represent the colors are: R Y G U B W"
      return true
    elsif code.length > 4
      puts "Your #{code_type} is too long, it should only be 4 characters. Remember not to use spaces."
      return true
    elsif code.length < 4
      puts "Your #{code_type} is not longe enough, use 4 letters"
      return true
    end
    return false
  end

  def all_chars_valid?(guess)
    all_colors = ["R", "Y", "G", "U", "W", "B"]
    all_chars_valid = true
    guess.upcase.each_char { |char| all_chars_valid = false unless all_colors.include?(char)}
    all_chars_valid
  end

  def player_type_valid?(player_type)
    if player_type == "human" || player_type == "computer"
      return true
    else
      puts "You must choose human or computer."
    end
  end

  # TO DO I can universalize player_type_valid? to check for this instead
  def difficulty_valid?(difficulty)
    if difficulty == "hard" || difficulty == "regular"
      return true 
    else
      puts "You must choose hard or regular"
    end
  end

  def format_string(user_string)
    user_string.upcase.split("")
  end
end
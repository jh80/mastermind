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
end
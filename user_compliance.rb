module UserCompliance
  def code_format_issue?(guess)
    if !all_chars_valid?(guess)
      puts "The available letters to represent the colors are: R Y G U B W"
      return true
    elsif guess.length > 4
      puts "Your guess is too long, it should only be 4 characters. Remember not to use spaces."
      return true
    elsif guess.length < 4
      puts "Your guess is not longe enough, use 4 letters"
      return true
    end
    return false
  end
end
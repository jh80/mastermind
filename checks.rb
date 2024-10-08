module Checks
  # rc_rp stands for right color right place
  # rc_wp stands for right color wrong place
  def find_rc_rp_indexes(code_array, guess_array)
    rc_rp_indexes = []
    code_array.each_with_index do |code_color, idx|
      if code_color == guess_array[idx]
        rc_rp_indexes << idx
      end
    end
    rc_rp_indexes
  end

  def remove_elements_by_indexes(array, indexes)
    array.select.with_index do |_, index|
       !indexes.include?(index)
    end
  end

  def calculate_rp_rc_count(guess_array, filtered_guess)
    guess_array.length - filtered_guess.length
  end

  def count_rc_wp(filtered_code, filtered_guess)
    all_colors = ["R", "Y", "G", "U", "W", "B"]
    all_colors.reduce(0) do |rc_wp_count, color|
      code_count, guess_count = filtered_code.count(color), filtered_guess.count(color)
      rc_wp_count += code_count >= guess_count ? guess_count : code_count
    end
  end

  def print_hint(rc_rp_count, rc_wp_count)
    print "hint:"
    rc_rp_count.times {print " r"} 
    rc_wp_count.times {print " w"}
    puts ""
  end 


  def evaluate_guess(guess)
    rc_rp_indexes = find_rc_rp_indexes(@code, guess)
    filtered_code = remove_elements_by_indexes(@code, rc_rp_indexes)
    filtered_guess = remove_elements_by_indexes(guess, rc_rp_indexes)
    rc_rp_count = calculate_rp_rc_count(guess, filtered_guess)
    rc_wp_count = count_rc_wp(filtered_code, filtered_guess)
    print_hint(rc_rp_count, rc_wp_count)
    rc_rp_count
  end
end
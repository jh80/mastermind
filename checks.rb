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

  def count_rc_wp(filtered_code, filtered_guess)
    all_colors = ["R", "Y", "G", "U", "W", "B"]
    all_colors.reduce(0) do |rc_wp_count, color|
      code_count, guess_count = filtered_code.count(color), filtered_guess.count(color)
      rc_wp_count += code_count >= guess_count ? guess_count : code_count
    end
  end
end
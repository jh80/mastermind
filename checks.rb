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
end
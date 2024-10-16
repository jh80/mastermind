class World
  # TO DO attr reader for testing!
  attr_accessor :rules

  attr_reader :available_colors_collection

  def initialize
    @all_colors = ["R", "Y", "G", "U", "B", "W"]
    @available_colors_collection = Array.new(4, @all_colors)
    @rules = []
  end

  def add_rule(guess, rc_rp, rc_wp)
    @rules << {guess: guess, rc_rp: rc_rp, rc_wp: rc_wp}
  end
end
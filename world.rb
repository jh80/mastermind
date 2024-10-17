class World
  # TO DO attr reader for testing!
  attr_accessor :rules, :available_colors_collection

  def initialize
    @all_colors = ["R", "Y", "G", "U", "B", "W"]
    @available_colors_collection = Array.new(4, @all_colors)
    @rules = []
  end

  def add_rule(guess, rc_rp, rc_wp)
    @rules << {guess: guess, rc_rp: rc_rp, rc_wp: rc_wp}
  end

  def process_results(rule)
    if (rule[:rc_rp] + rule[:rc_wp]) == 4
      @available_colors_collection.each_with_index do |available_colors, i|
        new = available_colors.select {|color| rule[:guess].include?(color)}
        @available_colors_collection[i] = new
      end
    end
    if (rule[:rc_rp] + rule[:rc_wp]) == 0
      @available_colors_collection.each_with_index do |available_colors, i|
        new = available_colors.select {|color| !rule[:guess].include?(color)}
        @available_colors_collection[i] = new
      end
    end
  end
end
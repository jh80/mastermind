class World
  # TO DO attr reader for testing!
  attr_reader :available_colors_collection

  def initialize
    @all_colors = ["R", "Y", "G", "U", "B", "W"]
    @available_colors_collection = Array.new(4, @all_colors)
    @rules = []
  end
end
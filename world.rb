require './checks.rb'

class World
  include Checks
  # TO DO attr reader for testing!
  attr_accessor :rules, :available_colors_collection, :the_colors , :all_colors, :all_codes, :viable_codes

  attr_reader :code_length
  def initialize
    @all_colors = ["R", "Y", "G", "U", "B", "W"].shuffle
    @code_length = 4
    @all_codes = create_all_codes_list(@code_length, @all_colors)
    @viable_codes = @all_codes
    @available_colors_collection = Array.new(4, @all_colors)
    @rules = []
    @the_colors = false
  end

  def add_rule(guess, rc_rp, rc_wp)
    @rules << {guess: guess, rc_rp: rc_rp, rc_wp: rc_wp, rc_total: rc_rp + rc_wp}
  end

  def process_results(rule)
    if (rule[:rc_rp] + rule[:rc_wp]) == 4
      @the_colors = rule[:guess]
      @available_colors_collection.each_with_index do |available_colors, i|
        new = available_colors.select {|color| rule[:guess].include?(color)}
        @available_colors_collection[i] = new
      end
      if rule[:rc_wp] == 4
        @available_colors_collection.each_with_index do |available_colors, i|
          new = available_colors.select {|color| !(rule[:guess][i] == color)}
          @available_colors_collection[i] = new
        end
      end
    elsif (rule[:rc_rp] + rule[:rc_wp]) == 0
      @available_colors_collection.each_with_index do |available_colors, i|
        new = available_colors.select {|color| !rule[:guess].include?(color)}
        @available_colors_collection[i] = new
      end
    end
  end

  def create_all_codes_list(code_length, code_colors)
    all_codes = create_starting_array(code_colors)
    (code_length - 1).times do
      all_codes = create_next_paths_array(all_codes, code_colors)
    end
    all_codes
  end

  def create_starting_array(colors_array)
    colors_array.reduce([]) do |starting_arrays_array, color| 
      starting_arrays_array << [color]
    end
  end

  def create_next_paths_array(starting_array, colors_to_add)
    code_possibilities = []
    starting_array.each do |code_possibility|
      colors_to_add.each do |color|
        updated_possibility = code_possibility + [color]
        code_possibilities << updated_possibility
      end
    end
    code_possibilities
  end

  def update_viable_codes
    viable_codes = @viable_codes.select do |code|
      code_results = evaluate_guess(@rules[-1][:guess], code)
      code_results[:rc_rp] == @rules[-1][:rc_rp] && code_results[:rc_wp] == @rules[-1][:rc_wp]
    end
    @viable_codes = viable_codes
  end

  def update_intel(guess, results, guesser_difficulty)
    add_rule(guess, results[:rc_rp], results[:rc_wp])
    if guesser_difficulty == "hard"
      update_viable_codes
    else
      process_results(rules[-1])
    end
  end
end




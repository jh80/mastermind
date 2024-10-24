module ComputerIntelligence
  def generate_code(code_length)
    code = []
    all_colors = ["R", "Y", "G", "U", "W", "B"]
    code_length.times do
      code.push(all_colors.sample)
    end
    code
  end

  def generate_code_from_color_lib(world)
    loop do
      code = []
      if world.the_colors
        code = world.the_colors.shuffle
      else
        world.available_colors_collection.each do |available_colors|
        code.push(available_colors.sample)
        end 
      end
      next unless uses_available_colors?(code, world.available_colors_collection)
      return code unless world.rules.any? { |rule| rule[:guess] == code }
    end
  end

  def uses_available_colors?(sequence, available_colors_collection)
    sequence.each_with_index do |color, i|
      return false unless available_colors_collection[i].include?(color)
    end
    return true
  end
end
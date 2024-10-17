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
    code = []
    if world.the_colors
      return world.the_colors.shuffle
    end
    world.available_colors_collection.each do |available_colors|
      code.push(available_colors.sample)
    end
    code
  end
end
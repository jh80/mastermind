# frozen_string_literal: true

require './checks'

# Runs computer generated codes and guesses
module ComputerIntelligence
  include Checks

  def generate_code(code_length)
    code = []
    all_colors = %w[R Y G U W B]
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
    true
  end

  def generate_first_guess(code_colors, code_length = 4)
    quantity = code_length / 2
    colors = code_colors.sample(2)
    code = Array.new(quantity, colors[0]) + Array.new(quantity, colors[1])
    return code + [color[1]] if code_length.odd?

    code
  end

  def generate_guess_from_viable_codes(viable_codes)
    viable_codes[0]
  end

  def computer_guess_hard(round, world)
    return generate_first_guess(world.all_colors) if round.zero?

    generate_guess_from_viable_codes(world.viable_codes)
  end

  def computer_guess_standard(round, world)
    generate_code_color_system(round, world)
  end

  def generate_code_color_system(round, world)
    rule = world.rules[-1]
    if round.zero?
      return Array.new(4, world.all_colors[0])
    elsif rule[:rc_total] < 4
      return Array.new(4, world.available_colors_collection[0][0]) if (rule[:rc_total]).zero?

      add_quant = 4 - rule[:rc_total]
      return rule[:guess].slice(0, rule[:rc_total]) + Array.new(add_quant, world.all_colors[round])

    end

    generate_code_from_color_lib(world)
  end
end

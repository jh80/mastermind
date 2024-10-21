# frozen_string_literal: true

require './checks'
require './human_code_maker'
require './inputable'

# This class holds the code maker's information and sets the code
class CodeMaker
  include Checks
  include HumanCodeMaker
  include Inputable

  # TO DO take out: Just for testing
  attr_reader :code

  def initialize
    @code_length = 4
    @code = []
    @code_maker_type = false
  end

  def generate_code
    code = []
    all_colors = %w[R Y G U W B]
    @code_length.times do
      code.push(all_colors.sample)
    end
    code
  end

  def set_code_maker_type
    @code_maker_type = get_player_type('Who will make the code? Human or Computer?')
  end

  def set_code
    set_code_maker_type
    @code = @code_maker_type == 'computer' ? generate_code : get_human_code
  end
end

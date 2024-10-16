require "./checks.rb"
require './human_code_maker.rb'

class CodeMaker
  include Checks
  include HumanCodeMaker

  # TO DO take out: Just for testing
  attr_reader :code
  def initialize()
    @code_length = 4
    @code = generate_code
  end

  def generate_code
    code = []
    all_colors = ["R", "Y", "G", "U", "W", "B"]
    @code_length.times do
      code.push(all_colors.sample)
    end
    code
  end
end
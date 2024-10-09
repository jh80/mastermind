require "./checks.rb"

class CodeMaker
  include Checks

  # TO DO take out: Just for testing
  attr_reader :code
  def initialize
    @code = ["R", "U", "G", "R"]
    @code_length = 4
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
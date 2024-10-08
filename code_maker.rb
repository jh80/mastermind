require "./checks.rb"

class CodeMaker
  include Checks

  # TO DO take out: Just for testing
  attr_reader :code
  def initialize
    @code = ["R", "U", "G", "R"]
  end
end
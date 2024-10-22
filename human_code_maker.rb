# frozen_string_literal: true

require './user_compliance'

# Gets user input to use as code
module HumanCodeMaker
  include UserCompliance

  def get_human_code
    code = ''
    loop do
      puts 'Please enter your code below:'
      code = gets.chomp
      break unless code_format_issue?(code, 'code')
    end
    format_string(code)
  end
end

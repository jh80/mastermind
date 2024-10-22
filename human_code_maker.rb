require './user_compliance.rb'

module HumanCodeMaker
  include UserCompliance

  def get_human_code
    code = ""
    loop do
      puts "Please enter your code below:"
      code = gets.chomp
      break unless code_format_issue?(code, "code")
    end
    format_string(code)
  end
end
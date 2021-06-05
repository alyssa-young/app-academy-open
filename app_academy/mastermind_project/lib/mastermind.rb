require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end
    def print_matches(code_instance)
        puts "Num exact matches:#{@secret_code.num_exact_matches(code_instance)}"
        puts "Num near matches: #{@secret_code.num_near_matches(code_instance)}"
    end
    def ask_user_for_guess
        puts 'Enter a code'
        input = Code.from_string(gets.chomp)
        puts "Num exact matches: #{@secret_code.num_exact_matches(input)}"
        puts "Num near matches: #{@secret_code.num_near_matches(input)}"
        input == @secret_code
    end
end
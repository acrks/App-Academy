require_relative "code"

class Mastermind
def initialize(length)
    @secret_code = Code.random(length)
end

def print_matches(code)
    p @secret_code.num_exact_matches(code)
    p @secret_code.num_near_matches(code)
end

def ask_user_for_guess
puts 'Enter a code'
input = gets.chomp
otra_inst = Code.from_string(input)
self.print_matches(otra_inst)
@secret_code == otra_inst
end
end

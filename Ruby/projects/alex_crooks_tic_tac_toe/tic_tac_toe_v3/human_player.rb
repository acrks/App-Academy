class HumanPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        puts 'enter a position with coordinates separated with a space like \'4 7\''
        input = gets.chomp.split
        raise 'Input is invalid' if input.length != 2 && !('0'..'9').include?(input)
        input = input.map! {|i| i.to_i} 
        while !legal_positions.include?(input)
            puts input.to_s + " is not a legal position"
            input = get_position(legal_positions)
        end
        return input
    end

    def mark
        @mark
    end
end
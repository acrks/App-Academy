class HumanPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts 'enter a position with coordinates separated with a space like \'4 7\''
        input = gets.chomp.split
        raise 'Input is invalid' if input.length != 2 && !('0'..'9').include?(input)
        return input.map! {|i| i.to_i}
    end

    def mark
        @mark
    end
end
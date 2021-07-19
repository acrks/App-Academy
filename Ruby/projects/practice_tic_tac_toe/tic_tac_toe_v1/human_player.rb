class HumanPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts 'Enter a row and column value separated by a space, for example \'0 2\''
        input = gets.chomp.split
        raise 'The row and column values you entered are not valid. Please try again' if input.any? {|i| !("0".."9").include?(i) } || input.length != 2
        input.map!(&:to_i)
    end
end
class ComputerPlayer
    def initialize(n)
        @recent = {}
        @selections = (0..n).to_a.permutation(2).to_a
        @guess = []
    end
    
    def get_input(board)
        if @guess.empty?
            first_guess_position = guess_position
            @guess << first_guess_position # changed to << because [] + [1,2] => [1,2] but wanted [[1,2]]
            return first_guess_position
        else
            first_position = @guess.pop
            first_card = board[first_position]
            if @recent.key?(first_card.char)
                return @recent[first_position]
            else
                second_guess_position = guess_position
                second_card = board[second_guess_position]
                @recent[second_card.char] = second_guess_position
                return second_guess_position
            end
        end
    end

    def remove_position(pos)
        @selections.delete(pos)
    end

    def add_position(pos)
        @selections << pos
    end
    
    def guess_position
        @selections = @selections.shuffle
        @selections.pop
    end
end
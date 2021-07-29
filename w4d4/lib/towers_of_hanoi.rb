class towers_of_hanoi
    attr_accessor :board
    attr_reader :starting_pos
    def initialize
        @board = createBoard
    end

    def createBoard
        # creates a game board of 3
        new_arr = Array.new(3) {Array.new}
        # prompts user for number of discs
        puts "How many discs would you like to play with"
        # Raise error if user inputs string, have them reenter
        # Otherwise put that number of discs onto one of the stacks
        input = gets.chomp.to_i
        @starting_pos = (0...3).to_a.sample
        new_arr[starting_pos] << (1..num).to_a.reverse
        new_arr
    end

    def play_turn
        # Loop until array at start_stack == empty? && end_stack.length == 4
        until won?
        # Print the game board
            render
        # Ask the player which stack they'd like to take from
            puts "Which stack would you like to take from?"
            # Raise error if out of bounds or empty stack
            # else
            input = gets.chomp.to_i
            # Pop from that stack
            player_move_disk = @board[input].pop
        # Ask the player which stack they'd like to move the disc to
            puts "Which stack would you like to take from?"
        # Raise error if out of bounds
        # else
            which_stack = gets.chomp.to_i
            # method to check if stack has smaller disc on top
            # If the top discs of end_pos are smaller than the disc of start_pos, throw an error/prompt to take turn again 
            valid_pos?(which_stack)
            # Else
            # Push the disc onto the stack
            @board[which_stack].push(player_move_disk)å
        end
    end

    # method to print game board
    def render
        p @board
    end

    # method to see if game won
    def won?
        # return array at index start stack == empty? && any other stack.length == 4

    end

    def valid_pos?(end_pos)
        #Return false if player move disc is larger than array at board[endPos].last
    end
end
require_relative 'card'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
    attr_reader :board, :human_player

    def initialize
        @board = Board.new
        @human_player = HumanPlayer.new
        @computer_player = ComputerPlayer.new(@board.length)
        @current_player = @human_player
    end

    def switch_players!
        if @current_player == @human_player
            @current_player = @computer_player
        else
            @current_player = @human_player
        end
    end

    def play
        @board.reveal_all
        @board.render
        sleep(3)
        @board.hide_all
        until @board.won?
            @board.render
            first_guess = get_guess
            second_guess = get_guess
            sleep(2)
            if @board[first_guess] != @board[second_guess]
                @board[first_guess].hide
                @board[second_guess].hide
                puts "Try again..."
            else
                puts "It's a match!"
            end
            switch_players!
        end
    end


    def get_guess
        # TODO: must be called from within the human player
        x,y = @current_player.get_input(@board)
        @board.reveal([x,y])
        @board.render
        return [x,y]
    end
end


if __FILE__ == $PROGRAM_NAME
    game = Game.new
    game.play
end

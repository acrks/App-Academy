require './board.rb'
require './human_player.rb'

class Game
    def initialize(player_1_mark, player_2_mark)
        @player1 = HumanPlayer.new(player_1_mark)
        @player2 = HumanPlayer.new(player_2_mark)
        @current_player = @player1
        @board = Board.new()
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def play
        while empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @current_player.win?(@current_player.mark)
                puts "Congratulations, " + @current_player.mark.to_s + "you won!"
                break
            else
                switch_turn
            end
        end
        puts 'It\'s a draw'
    end
end 
require './board.rb'
require './human_player.rb'

class Game
    def initialize(n, *player_marks)
        @players = player_marks.map {|i| HumanPlayer.new(i)}
        @player_num = 0
        @current_player = @players[@player_num]
        @board = Board.new(n)
    end
  
    def switch_turn
        @current_player = @players[(@player_num += 1) % @players.length]
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
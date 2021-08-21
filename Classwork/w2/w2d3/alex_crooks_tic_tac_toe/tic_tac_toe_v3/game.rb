require './board.rb'
require './human_player.rb'
require './computer_player.rb'

class Game
    def initialize(n, hash)
        @players = hash.map {|k, v| 
        if v
            ComputerPlayer.new(k)
        else
            HumanPlayer.new(k)
        end
        }
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
            pos = @current_player.get_position(@board.legal_positions)
            @board.place_mark(pos, @current_player.mark)
            if @current_player.win?(@current_player.mark)
                puts "Congratulations, " + @current_player.mark.to_s + "you won!"
                return
            else
                switch_turn
            end
        end
        puts 'It\'s a draw'
    end
end 
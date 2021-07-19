class Game
    def initialize(player_1, player_2)
        @dictionary = []
        @fragment 
    end

    def play_round
    end

    def current_player
    end

    def previous_player
    end

    def next_player!
    end

    def take_turn(player)
    end

    def valid_play?(string)
        alpha = ('a'..'z').to_a?(Array)
        return alpha.include?(string)
        # Checks that string is a letter of the alphabet and that there are words we can spell after 
        # adding it to the fragment
    end
end
#play_round
# The core game logic lives here. I wrote a number of helper methods to keep things clean:

#current_player
#previous_player
#next_player!: updates the current_player and previous_player
#take_turn(player): gets a string from the player until a valid play is made; 
then updates the fragment and checks against the dictionary. You may also want to alert the player 
if they attempt to make an invalid move (or, if you're feeling mean, you might cause them to lose outright).
#valid_play?(string): 

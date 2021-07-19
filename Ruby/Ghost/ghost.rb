# require_relative 'dictionary.txt'
class Ghost
    def initialize
        @dictionary = read_in_file(Hash.new(0))
        @fragment = []
    end

    def read_in_file(hash)
        line_num = 0
        dict = []
        File.readlines('dictionary.txt').each do |i|
            dict << i
        end
        dict
    end

    def play_round
        
    end

    def current_player
        @current_player
    end

    def previous_player
        @previous_player
    end

    def next_player!
        # updates current/previous player
    end

    def take_turn(player)
        
    end

end

g = Ghost.new()
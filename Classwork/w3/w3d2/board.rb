require_relative "card"

class Board
    attr_reader :length
    def initialize(length=4)
        @length = length
        @size = length**2
        @board = Array.new(length){Array.new(length)}
        populate
    end

    def populate
        letter_array = ('A'..'Z').to_a.sample(@size/2)
        letter_array += letter_array
        letter_array = letter_array.shuffle # shuffle doesn't mutate
        0.upto(@length-1) do |r|
            0.upto(@length-1) do |c|
                rand_card = Card.new(letter_array.pop)
                @board[r][c] = rand_card
            end
        end
    end

    def render
        system("clear")
        puts self.to_s
    end

    def reveal_all
        @board.each do |row|
            row.each do |card|
                card.reveal
            end
        end
    end

    def hide_all
        @board.each do |row|
            row.each do |card|
                card.hide
            end
        end
    end

    def won?
        @board.each do |i|
            return false if i.any? {|j| j.to_s == ' '}
        end
        return true
    end

    def reveal(pos)
        @board[pos[0]][pos[1]].reveal
    end


    def [](pos)
        @board[pos[0]][pos[1]]
    end

    def to_s
        str = "  " + (0...@length).to_a.join("  ") + "\n"
        @board.each_with_index do |el, i|
            str += i.to_s + " "
            el.each do |card|
                str += card.to_s + "  "
            end
            str += "\n"
        end
        str
    end
end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    board.render

    finished = false
    until finished
        print "enter pos (q to quit):"
        pos = gets
        x_s, y_s = pos.chomp.split(",")
        finished = pos.include?("q")
        if finished
            break
        end
        board.reveal([x_s.to_i, y_s.to_i])
        puts board
    end
end

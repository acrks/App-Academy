class Board
    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
    end

    def valid?(position)
        row, col = position
        row <= @grid.length && col <= @grid.length && row >= 0 && col >= 0
    end

    def empty?(position)
        @grid[position.first][position.last] == '_'
    end

    def place_mark(position, mark)
        raise if !valid?(position) || !empty?(position)
        @grid[position.first][position.last] = mark
    end

    def print
        @grid.each {|i| puts i.join(" ")}
    end

    def win_row?(mark)
        @grid.any? {|i| i.all? {|j| j == mark}}
    end

    def win_col?(mark)
        @grid.transpose.any? {|i| i.all? {|j| j == mark}}
    end

    def win_diagonal?(mark)
        arr_2 = []
        n = @grid.length - 1
        i = 0
            while i < @grid.length
                arr_2 << @grid[i][n]
                i += 1
                n -= 1
            end
        return (0...@grid.length).all? {|i| @grid[i][i] == mark} || arr_2.all? {|i| i == mark}
    end

    def win?(mark)
        win_col?(mark) || win_diagonal?(mark) || self.win_row?(mark)
    end

    def empty_positions?
        @grid.any? {|i| i.any? {|j| j == '_'}}
    end
end
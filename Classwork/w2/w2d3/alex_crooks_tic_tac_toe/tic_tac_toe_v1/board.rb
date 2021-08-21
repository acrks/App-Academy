class Board
    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
        @length = @grid.length - 1
    end

    def valid?(position)
        position.first <= @length && position.last <= @length && position.first >= 0 && position.last >= 0
    end

    def empty?(position)
        @grid[position.first][position.last] == '_'
    end

    def place_mark(position, mark)
        raise if !valid?(position) || !empty?(position)
        row, col = position
        @grid[row][col] = mark
    end

    def print
        @grid.each { |i| puts i.join(" ") }
    end

    def win_row?(mark)
        @grid.each do |arr|
            return true if arr.uniq.length == 1 && arr.uniq.include?(mark)
        end
        return false
    end

    def win_col?(mark)
        @grid.transpose.each do |arr|
            return true if arr.uniq.length == 1 && arr.uniq.include?(mark)
        end
        return false
    end

    def win_diagonal?(mark)
        arr = (0..@length).collect {|i| @grid[i][i]}
        arr.uniq.length == 1 && arr.uniq.include?(mark)
    end

    def win?(mark)
        win_col?(mark) || win_diagonal?(mark) || win_row?(mark)
    end

    def empty_positions?
        @grid.flatten.any? {|i| i == '_'}
    end
end
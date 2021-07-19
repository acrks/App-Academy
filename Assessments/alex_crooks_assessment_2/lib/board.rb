class Board
    attr_reader :size
    def initialize(size)
        @size = size
        @grid = Array.new(@size) {Array.new(@size)} 
    end

    def [](pos)
        @grid[pos.first][pos.last]
    end

    def []=(pos,mark)
        @grid[pos.first][pos.last] = mark
    end

    def complete_row?(mark)
        !@grid.all? {|i| i.any? {|j| j != mark}}
    end

    def complete_col?(mark)
        !@grid.transpose.all? {|i| i.any? {|j| j != mark}}
    end

    def complete_diag?(mark)
        arr = []
        n = @grid.length - 1
        i = 0
        while i < @grid.length
            arr << @grid[n][i]
            i += 1
            n -= 1
        end
        !(0...@grid.length).any? {|i| @grid[i][i] != mark} || !arr.any? {|j| j != mark}
    end

    def winner?(mark)
        complete_col?(mark) || complete_row?(mark) || complete_diag?(mark)
    end
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end

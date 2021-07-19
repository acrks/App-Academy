class Board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n ** 2
    end

    def size
        @size
    end
    
    def [](arr)
        return @grid[arr.first][arr.last]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def num_ships
        count = 0
        @grid.flatten.each do |i|
            count += 1 if i == :S
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self.[]=(pos, :H)
            p 'you sunk my battleship'
            return true
        else
            self.[]=(pos, :X)
            return false
        end
    end

    def place_random_ships
        while self.num_ships < self.size * 0.25
            nums = [rand(0...@grid.length), rand(0...@grid.length)]
            self.[]=(nums, :S) if self[nums] != :S
        end
    end

    def hidden_ships_grid
        arr = Array.new(self.size ** 0.5) {Array.new(self.size ** 0.5, :N)}
        @grid.each_with_index do |ele, i|
            ele.each_with_index do |el, j|  
                if el == :S
                    arr[i][j] = :N
                else 
                    arr[i][j] = el
                end
            end
        end
        arr
    end

    def self.print_grid(grid)
        grid.each do |i|
            puts i.join(" ")
        end    
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end 

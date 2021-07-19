class Board
    attr_reader :max_height
    def self.build_stacks(num_stacks)
        Array.new(num_stacks) {[]}
    end

    def initialize(num_stacks, max_height)
        raise 'rows and cols must be >= 4' if num_stacks < 4 || max_height < 4
        @max_height = max_height
        @stacks = Board.build_stacks(num_stacks)
    end

    def add(token, stack_index)
        if @stacks[stack_index].length < @max_height
            @stacks[stack_index] << token 
            return true
        else
            return false
        end
    end

    def vertical_winner?(token)
        (0...@stacks.length).each do |i|
            return true if @stacks[i].all? {|i| i == token} && @stacks[i].length == @max_height
        end
        return false
    end

    def horizontal_winner?(token)
        arr = @stacks.map {|a| Array.new(@max_height) {|i| a[i] || nil }}
        arr.transpose.each do |ele|
            return true if ele.all? {|j| j == token}
        end
        return false
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end

end
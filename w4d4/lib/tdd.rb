class Array
    def my_uniq
        new_arr = []
        self.each do |ele|
            new_arr << ele unless new_arr.include?(ele)
        end
        new_arr
    end

    def two_sum
        new_arr = []
        (0...self.length - 1).each do |i|
            (i + 1...self.length).each do |j|
                new_arr << [i, j] if j > i && self[i] + self[j] == 0
            end
        end
        new_arr.sort
    end

    def my_transpose
        new_arr = Array.new(self.length) {Array.new(self.length)}
        (0..self.length - 1).each do |row|
            (0..self.length - 1).each do |ele| 
                new_arr[ele][row] = self[row][ele]
            end
        end
        new_arr
    end

    def stock_picker 
        new_arr = []
        buy = self.index(self.min)
        new_arr << buy

        sell = self.index(self[buy..-1].max)
        new_arr << sell

        new_arr
    end
    
    
end


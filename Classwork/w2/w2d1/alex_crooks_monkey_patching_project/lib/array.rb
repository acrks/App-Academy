# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        return self.max - self.min
    end

    def average
        return nil if self.empty?
        return self.sum * 1.0 / self.size
    end

    def median
        return nil if self.empty?
        if self.size.even?
            return (self.sort[self.size / 2] + self.sort[self.size/2 - 1]) / 2.0
        else
            return self.sort[self.size/2]
        end
    end
    
    def counts
        hash = Hash.new(0)
        self.each do |i|
        hash[i] += 1
        end
        hash 
    end

    def my_count(val)
        self.counts[val]
    end

    def my_index(val)
        self.each_with_index do |ele, i|
            return i if ele == val
        end
        return nil
    end

    def my_uniq
        self.counts.keys
    end

    def my_transpose
        arr = Array.new(self.length) {(Array.new(self.length))}
            (0...self.length).each do |i|
                (0...self.length).each do |j|
                    arr[j][i] = self[i][j]
            end
        end
        arr
    end
end

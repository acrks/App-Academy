class Stack
    def initialize
        @underlying_array = []
    end

    def size
        @underlying_array.size
    end

    def empty?
        @underlying_array.empty?
    end

    def top
        @underlying_array[-1]
    end

    def peek(n)
        new_arr = []
        (0...n).each do |i|
            new_arr << @underlying_array[-1-i]
        end
        new_arr
    end

    def push(item)
        @underlying_array << item
        @underlying_array.length
    end

    def pop
        return nil if @underlying_array.empty?
        return @underlying_array.pop
    end
end


class SmartStack < Stack    
    attr_reader :max_size
    def initialize(num)
        @max_size = num
        @underlying_array = []
    end

    def full?
        @underlying_array.length == max_size
    end

    def push(*nums)
        raise 'stack is full' if nums.length + @underlying_array.length > max_size
        nums.each do |ele|
            @underlying_array.push(ele)
        end
        @underlying_array.length
    end

    def pop(n = -1)
        if n == -1
            return [@underlying_array.pop]
        elsif n > @underlying_array.length
            new_arr = []
            n.times do |i|
                if @underlying_array.empty?
                    new_arr << nil 
                else
                    new_arr << @underlying_array.pop 
                end
            end
            return new_arr
        else
            new_arr = []
            n.times do |i|
                new_arr << @underlying_array.pop
            end
            new_arr
        end

    end
end
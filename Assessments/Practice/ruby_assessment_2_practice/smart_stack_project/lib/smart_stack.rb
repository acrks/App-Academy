class Stack
    def initialize
        @underlying_array = []
    end

    def size
        @underlying_array.length
    end

    def empty?
        size == 0
    end

    def top
        return @underlying_array[-1]
    end

    def peek(n)
        @underlying_array[-n..-1]
    end

    def push(item)
        @underlying_array.push(item).count
    end

    def pop
        @underlying_array.pop
    end
end

class SmartStack < Stack
    def initialize(number)
        @max_size = number
        @underlying_array = []
    end

    def max_size
        @max_size
    end

    def full?
        @underlying_array.length == max_size
    end

    def push(*nums)
        raise 'stack is full' if nums.length + @underlying_array.length > max_size
        nums.each do |i|
            @underlying_array << i
        end
        @underlying_array.length
    end

    def pop(n = -1)
        if n == -1
            return [@underlying_array.pop]
        end
        new_arr = []
        if n > @underlying_array.length
            n.times do |i|
                if @underlying_array.empty?
                    new_arr << nil
                else
                    new_arr << @underlying_array.pop
                end
            end
            new_arr
        else
            n.times do |i|
                new_arr << @underlying_array.pop
            end
        end
        new_arr
    end  
end
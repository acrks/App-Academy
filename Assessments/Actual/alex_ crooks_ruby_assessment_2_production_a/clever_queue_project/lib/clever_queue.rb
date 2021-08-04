class SimpleQueue
    attr_reader :size
    
    def initialize
        @hidden_array = []
    end

    def size
        @hidden_array.length
    end

    def vacant?
        @hidden_array.empty?
    end

    def front
        @hidden_array[0]
    end

    def back
        @hidden_array[-1]
    end

    def first(n)
        @hidden_array[0...n]
    end

    def last(n)
        @hidden_array[n..-1]
    end

    def enqueue(item)
        @hidden_array << item
        @hidden_array.length
    end

    def dequeue
        return nil if vacant?
        @hidden_array.shift
    end
end

class CleverQueue < SimpleQueue
    attr_reader :capacity
    attr_accessor :soft_limit
    def initialize(num1, num2)
        raise 'invalid args' if num1 < num2
        @capacity = num1
        @soft_limit = num2
        @hidden_array = []
    end

    def enqueue(*args)
        raise 'queue is full' if args.length + @hidden_array.length > capacity
        args.each do |item|
            @hidden_array << item
        end
        @hidden_array.length
    end

    def dequeue(n = -1)
        return [@hidden_array.shift] if n == -1 
        new_arr = []
        n.times do |i|
            if @hidden_array.empty?
                new_arr << nil
            else
                new_arr << @hidden_array.shift
            end
        end
        new_arr
    end

    def trim()
        if @hidden_array.length < soft_limit
            return false
        else
            until @hidden_array.length == soft_limit
                @hidden_array.pop
            end
            return true
        end
    end
end
class Array
    def my_each(&prc)
        (0...self.length).each do |i|
            prc.call(self[i])
        end
        self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if prc.call(ele)
        end
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if !prc.call(ele)
        end
        new_arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        return false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        return true
    end

    def my_flatten
        arr = []
        self.my_each do |ele| 
            if ele.kind_of?(Array)
                arr += ele.my_flatten
            else
                arr << ele
            end
        end
        arr
    end

    # Write my_zip to take any number of arguments. 
    # It should return a new array containing self.length elements. 
    # Each element of the new array should be an array with a length 
    # of the input arguments + 1 and contain the merged elements at 
    # that index. If the size of any argument is less than self, 
    # nil is returned for that location.

    def my_zip(*args)
        new_arr = []
        self.each_with_index do |ele, i|
            sub_arr = [ele]
            (0...args.length).each do |j|
                sub_arr << args[j][i]
            end
            new_arr << sub_arr
        end
        new_arr
    end

    # Write a method my_rotate that returns a new array 
    # containing all the elements of the original array in 
    # a rotated order. By default, the array should rotate 
    # by one element. If a negative value is given, 
    # the array is rotated in the opposite direction.
    def my_rotate(n = 1)
        new_arr = self
        if n < 0
            n *= -1
            n.times do |i|
                new_arr.unshift(new_arr.last)
                new_arr.pop
            end

        else
            n.times do |i|
                new_arr.push(new_arr.first)
                new_arr.shift
            end
        end
        new_arr
    end

    # my_join returns a single string containing all the elements of 
    # the array, separated by the given string separator. If no separator 
    # is given, an empty string is used.

    def my_join(seper = "")
        new_word = ""
        self.each do |char|
            new_word += char + seper
        end
        return new_word[0...-1] if new_word[-1] == seper
        new_word
    end

    def my_reverse
        new_word = []
        n = self.length
        while n > 0
            new_word << self[n - 1]
            n -= 1
        end 
        new_word
    end

    def factors(num)
        (1..num).each {|i| self << i if num % i == 0}
        self
    end

    def bubble_sort!(&prc)
        prc ||= Proc.new {|el, el2| el > el2 }
        sorted = true
        while sorted
        sorted = false
            (0...self.length - 1).each do |i|
                self[i], self[i+1] = self[i+1], self[i] if prc.call(self[i], self[i+1])
                    sorted = true
            end
        end
        self
    end
end

# return_value = [1, 2, 3].my_each do |num|
#     puts num
#   end.my_each do |num|
#     puts num
#   end

# p return_value

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

p [].factors(10)

a = [1,2,3,4,5].shuffle
p a.bubble_sort!
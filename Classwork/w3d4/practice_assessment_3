#App Academy Recursion Exercises
require 'byebug'
def range(min, max)
    return [] if max <= min
    arr = []
    arr += [min] + range(min + 1, max)
end

# p range(1,5)

def iter_sum(array)
    total = 0
    array.each {|i| total += i}
    total
end

# p iter_sum([1,2,3]) #=> 6

def recur_sum(array)
    return 0 if array.length < 1
    array.pop + recur_sum(array)
end

# p recur_sum([1,2,3]) #=> 6

# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

def exp_1(num, exp)
    return 1 if exp == 0
    return num if exp == 1
    num * exp_1(num, exp - 1)
end

# p exp_1(5, 3)
# p exp_1(12, 2)
# p exp_1(5, 0)
# p exp_1(5, 1)

def exp_2(num, exp)
    return 1 if exp <= 0
    return num if exp == 1
    result = 0
    if num.even?
        result = exp_2(num, exp / 2) ** 2
    else
        result = num * exp_2(num, (exp - 1) / 2) ** 2
    end
    result
end

# p exp_2(2, 2) #=> 4
# p exp_2(3, 3) #=> 27

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
# Note that for recursion 2, you will need to square the results of exp(b, n / 2) and (exp(b, (n - 1) / 2). 
# Remember that you don't need to do anything special to square a number, just calculate the value and multiply it by itself.

def deep_dup(data) #Array
    # puts data.object_id
    # return if data.empty?
    # return data if data.is_a?(Array)
    # return data if data.is_a?(Array)
    arr = []
    # arr << data[0]
    # arr << deep_dup(data[1..-1])
    data.each do |ele|
        if !ele.is_a?(Array)
            arr << ele
        else
            arr << deep_dup(ele)
        end
    end

    arr
end

arr_1 = ['a','b',['c']]
#'a' -> not an array -> shovel into our new array
#'b' -> not an array -> shovel into our new array
#['c'] -> is an array -> create a new array -> iterate through <---- array, make a recursive call to copy each ele
robot_parts = [
    ["nuts", "bolts", "washers"],
    ["capacitors", "resistors", "inductors"]
  ]

# copy_array = deep_dup(robot_parts)
# p copy_array
# copy_array[1] << "LEDS"
# p copy_array
# # p robot_parts.object_id
# p robot_parts

def fib_recur(n)
    return [0] if n == 0
    return [0, 1] if n == 1
    last_fib_seq = fib_recur(n-1)
    last_fib_seq += [last_fib_seq[-1] + last_fib_seq[-2]]
end

# p fib_recur(3)
# p fib_recur(6)
# p fib_recur(10)

def fib_iter(n)
    return [0] if n == 0
    return [0, 1] if n == 1
    seq = [0, 1]
    (0...n-1).each do |i|
        seq << seq[-1] + seq[-2]
    end
    seq
end

# p fib_iter(3)
# p fib_iter(6)
# p fib_iter(10)

def bsearch(array, target)
    return nil if array.length == 1 && target != array[0]
    mid_length = array.length / 2
    if target == array[mid_length]
        return mid_length
    elsif !bsearch(array[mid_length...array.length], target).nil?
        mid_length += bsearch(array[mid_length...array.length], target)
    else
        bsearch(array[0...mid_length], target)
    end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    return array if array.length <= 1
    mid_length = array.length / 2
    merge(merge_sort(array[0...mid_length]), merge_sort(array[mid_length..-1]))
end

# Merge the sorted halves
def merge(arr_1, arr_2)
    arr_1_l = arr_1.length
    arr_2_l = arr_2.length
    arr = []
    while arr.length < arr_1_l + arr_2_l
        if arr_1.empty?
            arr_2.each {|el| arr << el}
        elsif arr_2.empty?
            arr_1.each {|el| arr << el}
        elsif arr_1[0] < arr_2[0]
            arr << arr_1.shift
        elsif arr_1[0] > arr_2[0]
            arr << arr_2.shift
        end 
    end
    return arr
end

# p merge([3,6,7,10],[1,2,4,19])

# p merge_sort([38, 27, 43, 3, 9, 82, 10])

# p merge_sort([90, 27, 321, 6600, 102, 34, 77])

# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.

def subsets(array)
    return [[]] if array.empty?
    return [[], array] if array.length == 1
    arr = []
    prev_subset = subsets(array[0...-1])
    prev_subset.each do |subset|
        arr << subset + [array[-1]]
    end
    arr = prev_subset + arr
end

#Calling subsets([1,2]) means there are two different kinds of subsets
#Ones that do not contain 2 --> [], [1]
#Ones that are the same as above, but DO contain 2 --> [2], [1, 2]
#Calling subsets([1,2]) = Adding elements [2] & [1,2] to subsets([1])
# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# def permutations(array)
#     # if array.length == 
#     # arr = [array]
#     # (1...array.length).each do |i|

#     # arr << permutations(array[1..array.length - 1] + [array[1]])
# end

# p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]
# iteration 1 - unchanged
# iteration 2 - index 1 rotates 1 to the right [index 1-> index 2] and index 2 switch
# iteration 3 -index 2 rotates 1 to the right [index 2-> index 0] and index 1 switch
# iteration 4 -index 1 rotates 1 to the right [index 1 -> index 2] and index 2 switch
# iteration 5 -index 0 to index 2
# iteration 6 -index 1 rotates to index 2 / completely reversed from iteration 1

# Time complexity = O(n^2)

def bad_two_sum?(arr, target_sum)
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum && i != j
        end
    end
    false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# Time Complexity -> O(n(log(n)))
def ok_two_sum?(arr, target_sum) 
    arr.sort!
    (0...arr.length).each do |i|
        new_target = target_sum - arr[i]
        return true if !bsearch(arr[i+1..-1], new_target).nil?
    end
    return false
end

def bsearch(arr, target)
    return nil if arr.empty?
    mid = arr.length / 2
    if arr[mid] == target
        return mid
    else
        left = arr[0...mid]
        right = arr[mid+1..-1]
        if target < arr[mid]
            return bsearch(left, target)
        else
            some_val = bsearch(right, target)
            some_val.nil? ? nil : some_val + mid + 1
        end
    end
end

# arr = [0, 1, 5, 7]
# p ok_two_sum?(arr, 6) # => should be true
# p ok_two_sum?(arr, 10) # => should be false


# Time Complexity
def two_sum?(arr, sum)
    hash = Hash.new
    arr.each do |ele|
        complement = sum - ele
        if hash[complement] != nil
            return true
        else
            hash[ele] = 1
        end
    end
    false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
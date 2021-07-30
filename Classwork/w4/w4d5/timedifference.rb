def my_min(arr)
  (0...arr.length).each do |i|
    min = true

    (0...arr.length).each do |j|
      next if arr[i] == arr[j]
      min = false if arr[j] < arr[i]
    end

    return arr[i] if min
  end
end

def my_min2(arr)
  min = arr.first
  (0...arr.length).each do |i|
    min = arr[i] if arr[i] < min
  end
  min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. 
# Find the sums of all contiguous sub-arrays and return the max.

# Example:

def largest_contiguous_subsum(arr)
  temp_val = []
  (0...arr.length).each do |start|
    (start...arr.length).each do |last|
      temp_val << arr[start..last]
    end
  end
  variable = temp_val.first.sum
  temp_val.each do |a|
    variable = a.sum if a.sum > variable
  end
  return variable
end

list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8

# Example 2:
list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# Example 3:
list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])

def largest_contiguous_subsum2(arr)
  temp_val = []
  last = 0
  (0...arr.length).each do |start|
    (start...arr.length).each do |last|
      temp_val << arr[start..last]
    end
  end
  variable = temp_val.first.sum
  temp_val.each do |a|
    variable = a.sum if a.sum > variable
  end
  return variable
end

# Let's make a better version. Write a new function using O(n) time with O(1) memory. 
# Keep a running tally of the largest sum. To accomplish this efficient space complexity, consider using two variables. 
# One variable should track the largest sum so far and another to track the current sum. We'll leave the rest to you.

list = [5, 3, -7]
p largest_contiguous_subsum2(list) # => 8

# Example 2:
list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# Example 3:
list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])



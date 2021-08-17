# Validate Subsequence

# Given two non-empty arrays of integers, write a function that determines whether the second array is a subsequence of the first one.

# A subsequence of an array is a set of numbers that aren't necessarily adjacent but that are in the same order as they appear in the array. For instance, the numbers [1,3,4] form a subsequence of the array [1, 2, 3, 4], and so fo the numbers [2, 4]. Note that a single number in an array and the array itself are both valid sub sequences of the array.

def validate_sub(array, seq)
    comp_int = seq.first
    (0...array.length).each do |i|
        if array[i] == comp_int
            seq.shift
            comp_int = seq.first
        end
    end
    seq.empty?
end


# Sample Input:
array= [5, 1, 22, 25, 6, -1, 8, 10]
seq = [1, 6, -1, 10]

p validate_sub(array, seq)

# Sample Output:
# True

# Given the root of a binary tree, return its maximum depth.

# A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

# Input: root = [3,9,20,null,null,15,7]

def max_depth(array, int = 0)
    return 0 if array.nil? || array.empty?
    left_child = 2 * int + 1
    right_child = 2 * int + 2
    if array[left_child] != 'null'
        return 1 + max_depth(array[left_child..-1], int + 1) 
    elsif array[right_child] != 'null'
        return 1 + max_depth(array[right_child..-1], int + 1) 
    end
end

root = [3,9,20,'null','null',15,7] #=> 3
p max_depth(root)

root = [1,'null',2] 
p max_depth(root) #=> 2

root = [] #=> 0
p max_depth(root)

# base case = node does not have any children, return 0
# iterate through children
# return 1 + recursively call the function 

# Input: root = [3,9,20,null,null,15,7]
# Output: 3

# Example 2:

# Input: root = [1,null,2]
# Output: 2

# Example 3:

# Input: root = []
# Output: 0
# Example 4:

# Input: root = [0]
# Output: 1
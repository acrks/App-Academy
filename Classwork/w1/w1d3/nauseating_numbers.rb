# def strange_sums(array)
#     counter = 0
#     array.each_with_index do |ele, idx|
#         array[idx+1..-1].each do |ele2|
#             counter += 1 if ele + ele2 == 0
#         end
#     end
#     counter
# end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

# def pair_product(numbers, product)
#     numbers.each_with_index do |ele, idx|
#         numbers[idx+1..-1].each do |ele2|
#             return true if ele * ele2 == product
#         end
#     end
#     false
# end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

# def rampant_repeats(string, hash)
#     new_str = ""
#     string.each_char do |char|
#         if hash[char] != nil
#             hash[char].times {new_str += char}
#         else
#             new_str += char
#         end
#     end
#     new_str
# end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

# def perfect_square(num)
#     if (Math.sqrt(num) % 1) == 0
#         return true
#     else
#         return false
#     end
# end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

# def count_factors(n)
#     (1..n).count { |i| n % i == 0 }
# end

# def anti_prime?(n)
#     amount = count_factors(n)
#     (1...n).all? { |i| amount > count_factors(i) }
# end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false 

def matrix_addition(m_1, m_2)
    height = m_1.length
    width = m_1[0].length
    result = Array.new(height) { [0] * width }
    (0...height).each do |row|
        (0...width).each do |col|
            result[row][col] = m_1[row][col] + m_2[row][col]
        end
    end
    result
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

# def factorize(num)
#     (1..num).select { |i| num % i == 0}
# end

# def mutual_factors(*num)
#     nums = num.map { |n| factorize(n) }
#     return nums.inject(:&)
# end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

# def tribonacci_number(num)
#     if num == 1 || num == 2
#         return 1
#     elsif num == 3
#         return 2
#     else
#         return tribonacci_number(num - 1) + tribonacci_number(num - 2) + tribonacci_number(num - 3) 
#     end
# end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274


def matrix_addition_reloaded(*mtrxs)
    return nil if mtrxs.any? { |arr| arr.length != mtrxs[0].length }
    matrix = mtrxs[0]
    height = mtrxs[0].length
    width = matrix[0].length
    empty_matrix = Array.new(height) { [0] * width }
    mtrxs.inject(empty_matrix) do |m1, m2|
        matrix_addition(m1, m2)
    end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arrays)
    if arrays.any? {|ele| ele.uniq.length == 1} || arrays.transpose.any? {|col| col.uniq.length == 1}
        return true
    end 
    return false
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(arrays)
    arr = []
    alt_arr = []
    height = arrays.first.length
    width = height
    i = 0
    n = 0
    while i < height
        arr << arrays[i][n]
        i += 1
        n += 1
    end
    i = height - 1
    n = 0
    while n < height
        alt_arr << arrays[i][n]
        i -= 1
        n += 1
    end
    if alt_arr.uniq.length == 1 || arr.uniq.length == 1
    return true
    else
        return false
    end
end

p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false

# def adjacent_sums(arr)
#     sums = []
#     (0...arr.length-1).each do |i|
#         sums << arr[i] + arr[i + 1]
#     end
#     sums
# end

# def pascals_triangle(num)
#     array = [[1]]
#     while array.length < num
#         level_above = array.last
#         next_level = [1]
#         next_level += adjacent_sums(level_above)
#         next_level << 1
#         array << next_level
#     end
#     array
# end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]


# TODO: CHANGE

def prime?(num)
    return  false if num < 2
    (2...num).none? { |i| num % i == 0 }
end

def mersenne_prime(n)
    x = -1
    count = 0
    while count < n
        x += 1
        candidate = 2**x - 1
        count += 1 if prime?(candidate)
    end
    2**x - 1
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_sequence(num)
    arr = []
    i = 1
    while i <= num
        arr << (i * (i + 1)) / 2
        i += 1
    end
    return arr
end

def triangular_word?(word)
    alpha = ('a'..'z').to_a
    words = word.split('')
    words.map! { |char| alpha.index(char) + 1 }
    value = words.sum
    triangular_nums = triangular_sequence(value)
    triangular_nums.include?(value)
end


# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false



def consecutive_collapse(array)
    array.each { array = collapse(array) }
    return array
end

def collapse(array)
    (0...array.length - 1).each do |i|
        if array[i] + 1 == array[i + 1] || array[i] == array[i + 1] + 1
            return array[0...i] + array[i + 2..-1]
        end
    end
    return array
end

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []

def next_prime(number, i)
    step = 1
    if i < 0
        i = -(i)
        step = -(step)
    end
    prime_count = 0
    
    while prime_count < i
        return nil if number < 0
        number += step
        prime_count += 1 if prime?(number)
    end
    return number
end

def pretentious_primes(nums, step)
    nums.map { |ele| next_prime(ele, step) }
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]




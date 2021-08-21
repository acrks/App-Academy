def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end
    hash.keys.select {|k,v| hash[k] == 1}
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.size - 1).each {|i| return false if arr[i] == arr[i + 1] }
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new {|h, k| h[k] = []}
    str.each_char.with_index { |ele, idx| hash[ele] << idx }  
    hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    result = ""
    comp = ""
    (0...str.length).each do |i|
        if str[i] == str[i-1] || i == 0
            comp += str[i]
        else
            comp = str[i]
        end
        if comp.length >= result.length
            result = comp
        end
    end
    result
end

# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy'
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def prime?(num)
    return true if num == 2
    (2...num).none? {|i| num % i == 0}
end

def bi_prime?(num)
    array = []
    (1...num).each do |i|
        array << i if num % i == 0 && prime?(i)
    end
    (0...array.length).each do |i|
        (0...array.length).each do |j|
            return true if array[i] * array[j] == num
        end
    end
    return false
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(word, arr)
    alpha = ('a'..'z').to_a
    (0...word.length).each do |i|
        word[i] = (alpha[(alpha.index(word[i]) + arr[i % arr.length]) % 26])
    end
    word
end
# Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def switch_vowels
    
end

def vowel_rotate(str)
    new_str = str[0..-1]
    old_vowel_indexes = (0...str.length).select {|i| "aeiou".include?(str[i])}
    new_vowel_indexes = old_vowel_indexes.rotate(-1)
    old_vowel_indexes.each_with_index do |idx, i|
        new_vowel = str[new_vowel_indexes[i]]
        new_str[idx] = new_vowel
    end
    new_str
end

# Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&prc)
        return "" if prc.nil?
        new_str = ""
        self.each_char do |char|
            new_str += char if prc.call(char)
        end
        new_str
    end

    def map!(&prc)
        self.each_char.with_index do |ele, i|
            self[i] = prc.call(ele, i)
        end
    end
end

# Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""


# word_1 = "Lovelace"

# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(a, b)
    return 0 if b == 0

    if b.negative?
        -(a + multiply(a, (-b) - 1))
    else
        a + multiply(a, b - 1)
    end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(num)
    return [] if num == 0
        
    return [2] if num == 1
        
    return [2,1] if num == 2
    arr = lucas_sequence(num - 1)
    arr << arr[-1] + arr[-2]
    arr
end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    (2...num).each do |i|
        return [*prime_factorization(i), *prime_factorization(num / i)] if num % i == 0
    end
    [ num ]
end

# Examples
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]


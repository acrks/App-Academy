def element_count(array)
my_hash = Hash.new(0)
    array.each do |i|
        my_hash[i] += 1
    end
my_hash
end

def char_replace!(string, hash)
    string.each_char.with_index do |char, idx|
        string[idx] = hash[char] if hash[char]
    end
end

def product_inject(array)
    array.inject do |aca, ele|
        aca * ele
    end
end
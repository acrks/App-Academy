# Define your methods here. 
def first_letter_vowel_count(sentence)
    count = 0
    words = sentence.split(" ")
    vowels = "aeiou"
    words.each do |ele|
        count += 1 if vowels.include?(ele[0].downcase)
    end
    count
end

def count_true(array, proc)
    count = 0
    array.each do |ele|
        count += 1 if proc.call(ele)
    end
    count
end

def procformation(array, prc_1, prc_2, prc_3)
    array.each_with_index do |ele, i|
        if prc_1.call(ele)
            array[i] = prc_2.call(ele)
        else
            array[i] = prc_3.call(ele)
        end
    end
    array
end

def array_of_array_sum(arrays)
    #inject?
    total = 0
    arrays.each do |i|
        total += i.sum
    end
    total
end

def selective_reverse(string)
    new_sent = string.split(" ")
    vowels = "aeiou"
    new_sent.each_with_index do |word, idx|
        if !(vowels.include?(word[0]) || vowels.include?(word[-1]))
            new_sent[idx] = word.reverse
        end
    end
    new_sent.join(" ")
end

def hash_missing_keys(hash, *add)
    arr = []
    return [] if add.empty?
        add.each do |ele|
            arr << ele if !hash.has_key?(ele)
        end
    arr
end
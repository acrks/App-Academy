# Define your methods here.

def my_map!(arr, &block)
    arr.each_with_index { |ele, i| arr[i] = block.call(ele) }
end

def two?(arr, &block)
    arr.count {|ele| block.call(ele)} == 2
end

def nor_select(arr, prc_1, prc_2)
    arr.select { |ele| !prc_1.call(ele) && !prc_2.call(ele) }
end

def array_of_hash_sum(arr)
    acc = 0
    arr.each do |hash|
        hash.each do |k,v|
            acc += hash[k]
        end
    end
    acc
end

def slangify(sent)
    new_sent = []
    sent.split.each do |words|
        new_sent << remove_vowel(words)
    end
    new_sent.join(" ")
end

def remove_vowel(word)
    new_word = ""
    word.each_char.with_index do |char, idx|
        if "AEIOUaieou".include?(char)
            new_word = word[0...idx] + word[idx+1..-1]
            break
        else
            new_word = word
        end
    end
    new_word
end

def char_counter(string, *add)
    hash = Hash.new(0)
    if add.length == 0
        string.each_char { |char| hash[char] += 1 }
    else
        add.each {|i| hash[i] = 0 }
        string.each_char { |char| hash[char] += 1 if add.include?(char) }
    end
    hash
end
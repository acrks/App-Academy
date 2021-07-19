def partition(arr, num)
    new_arr = Array.new(2) { 
    Array.new(0) { } }
    arr.each do |ele|
    if ele < num
        new_arr[0] << ele 
    else
        new_arr[1] << ele
    end
end
    return new_arr
end

def merge(hash_1, hash_2)
    new_hash = {}
    hash_1.each do |k,v| 
        new_hash[k] = v
    end
    hash_2.each do |k,v| 
        new_hash[k] = v
    end
    new_hash
end

def censor(string, array)
    words = string.split(" ")
    words.map! do |ele|
        if array.include?(ele.downcase)
        ele = vowelreplace(ele)
    else
        ele = ele
    end
end
return words.join(" ")
end

def vowelreplace(word)
    new_str = ""
    word.each_char do |char|
    if "aeiou".include?(char.downcase)
        new_str += "*"
    else
        new_str += char
    end
end
return new_str
end

def power_of_two?(num)
    if num.to_s(2).count('1') == 1
        return true
    else
        return false
    end
end
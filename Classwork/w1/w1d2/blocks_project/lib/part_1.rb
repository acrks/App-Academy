def select_even_nums(array)
array.select {|num| num.even?}
end

def reject_puppies(array)
array.reject { |h| h["age"] < 3}
end

def count_positive_subarrays(array)
array.count {|sub_array| sub_array.sum > 0}
end

def aba_translate(string)
new_str = ""
string.each_char do |char|
    if "aeiou".include?(char)
        new_str += char + "b" + char
    else
        new_str += char
    end
end
    return new_str
end

def aba_array(array)
    return array.map {|ele|
    aba_translate(ele)
    }
end
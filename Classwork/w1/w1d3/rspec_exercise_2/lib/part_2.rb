def palindrome?(string)
    i = string.length - 1
    string.each_char.with_index do |char, idx|
    if char.downcase != string[i - idx].downcase
        return false
    end
end
return true
    end

def substrings(string)
    array = []
    (0...string.length).each do |idx|
        (idx...string.length).each do |alt_idx|
            array << string[idx..alt_idx]
        end
    end
    array
end

def palindrome_substrings(string)
    substrings(string).select do |ele|
        ele.length > 1 && palindrome?(ele)
    end
end
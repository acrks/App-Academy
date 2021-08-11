def common_prefix(array)
prefixes = Hash.new(0)
smallest_element = array.min
(0...smallest_element.length).each do |i|
    prefixes[smallest_element[0..i]] += 1
end

array.each do |ele|
    next if ele == smallest_element
    (0...ele.length).each do |j|
        substr = ele[0...j]
        prefixes[substr] += 1 if prefixes.keys.include?(substr)
    end
end

result = ""

prefixes.keys.each_with_index do |key, i|
    result = key if prefixes[key] > 1
    return result if prefixes[key] == 1
end

result

end


p common_prefix(["flower","flow","flight"])
p common_prefix(["dog","racecar","car"])



# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    new_arr = []
    (2..num).each do |factor|
        if num % factor == 0
            new_arr << factor if prime?(factor)
        end
    end
    return new_arr.max
end

def prime?(num)
    if num < 2
      return false
    end
  (2...num).each do |multiple|
    if num % multiple == 0
      return false
    end
  end
    return true
end

def unique_chars?(string)
    str = ""
    string.each_char do |char|
        if !str.include?(char)
            str += char
        else
            return false
        end
    end
    return true
end

def dupe_indices(array)
    hash = Hash.new {|h,k| h[k]=[]}
    array.each.with_index do |ele, idx|
        hash[ele] << idx
    end
    hash.delete_if {|key, value| value.length == 1}   
    return hash
end

def ana_array(array_1, array_2)
    if array_1.length > array_2.length
        count = array_1.length
    else
        count = array_2.length
    end
    array_2.each do |ele|
        count -= 1 if array_1.include?(ele)
    end
    if count == 0
        return true
    else   
        return false
    end
end
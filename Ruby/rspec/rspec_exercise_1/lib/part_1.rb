def average(num_1, num_2)
    num = (num_1 + num_2) / 2.0
    return num
end

def average_array(array)
    array.sum / (array.length * 1.0)
end

def repeat(str, num)
    new_str = ""
    num.times { new_str += str}
    return new_str
end

def yell(string)
    string.upcase + "!"
end

def alternating_case(string)
    arr = string.split(" ")
    arr.each_with_index do |ele, idx|
        if idx % 2 == 0
            arr[idx] = ele.upcase
        else
            arr[idx] = ele.downcase
        end
    end
    return arr.join(" ")
end
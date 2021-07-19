def reverser(string, &prc)
    prc.call(string.reverse())
end

def word_changer(string, &prc)
    arr = string.split(" ")
    arr.map! do |ele| prc.call(ele) end
    arr.join(" ")
end

def greater_proc_value(num, prc, prc_2)
    return [prc.call(num), prc_2.call(num)].max
end

def and_selector(arr, prc_1, prc_2)
    new_arr = []
    arr.each do |ele|
    if prc_1.call(ele) && prc_2.call(ele)
        new_arr << ele
    end
    end
    new_arr
end

def alternating_mapper(arr, prc_1, prc_2)
    new_arr = []
    arr.each_with_index do |ele, idx|
        if idx % 2 == 0
            new_arr << prc_1.call(ele)
        else
            new_arr << prc_2.call(ele)
        end
    end
    new_arr
end
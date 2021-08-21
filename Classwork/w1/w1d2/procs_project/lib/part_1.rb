def my_map(array, &prc)
    new_arr = []
    array.each {|ele| 
    new_arr << prc.call(ele)
    }
    return new_arr 
end

def my_select(array, &prc)
    new_arr = []
    array.each {|ele|
    if prc.call(ele)
        new_arr << ele
    end
    }
    return new_arr
end

def my_count(array, &prc)
    count = 0
    array.each {|ele|
    if prc.call(ele)
        count += 1
    end
    }
    count
end

def my_any?(array, &prc)
    array.each {|ele|
    if prc.call(ele)
        return true
    end
    }
    return false
end

def my_all?(array, &prc)
    array.each {|ele|
    if !prc.call(ele)
        return false
    end
    }
    return true
end

def my_none?(array, &prc)
    array.each {|ele|
    if prc.call(ele)
        return false
    end
    }
    return true
end
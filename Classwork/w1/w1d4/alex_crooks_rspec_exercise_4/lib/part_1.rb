def my_reject(array, &prc)
    new_arr = array.select {|i| !prc.call(i)}
end

def my_one?(array, &prc)
    array.count {|i| prc.call(i)} == 1
end

def hash_select(hash, &prc)
    new_hash = Hash.new(0)
    hash.each do |k, v|
        new_hash[k] = v if prc.call(k,v)
    end
    new_hash
end

def xor_select(array, prc_1, prc_2)
    
end
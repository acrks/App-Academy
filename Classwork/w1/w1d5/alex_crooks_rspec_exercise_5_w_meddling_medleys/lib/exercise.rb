def zip(*arrays)
    (0...arrays.first.length).map {|ele| arrays.map {|i| i[ele]}}
    # (0...arrays.first.length).map { |ele| arrays.map {|i| i[ele]}}
end

def prizz_proc(array, prc_1, prc_2)
    array.select {|i| (prc_1.call(i) || prc_2.call(i)) && !(prc_2.call(i) && prc_1.call(i))}
end

def zany_zip(*arrays)
    max = arrays.first.length
    arrays.each {|i| max = i.length if i.length > max}
    (0...max).map { |ele| arrays.map {|i| i[ele] || nil }}
end

def maximum(array, &prc)
    new_num = array.first
    array.each do |ele|
        new_num = ele if prc.call(ele) >= prc.call(new_num)
    end
    new_num
end

def my_group_by(array, &prc)
    hash = Hash.new() {|k,v| v = []}
    array.each do |ele|
        hash[prc.call(ele)] += [ele]
    end
    hash
end

def max_tie_breaker(array, prc, &block)
    new_num = array.first
    array.each do |i|
        if block.call(new_num) < block.call(i)
            new_num = i
        elsif block.call(new_num) == block.call(i)
            new_num = i if prc.call(new_num) < prc.call(i)
        end
    end
    new_num
end

def silly_syllables(sent)
    new_sent = sent.split
    new_sent.each_with_index do |word, i|
        vowel_indices = get_vowel_indexes(word)
        if vowel_indices.length > 1
            new_sent[i] = word[vowel_indices.first..vowel_indices.last]
        end
    end
    new_sent.join(" ")
end

def get_vowel_indexes(word)
    indices = []
    word.each_char.with_index do |char, i|
        indices << i if "AEIOUaeiou".include?(char)
    end
    indices        
end


def all_words_capitalized?(array)
    array.all? { |ele| ele.capitalize() == ele } 
end

def no_valid_url?(urls)
endings = [".com", '.net', '.io', '.org']
urls.none? {|ele| 
    endings.any? {|fin| ele.end_with?(fin)
    }
}
end

def any_passing_students?(hash)
    hash.any? {|h|
    (h[:grades].sum / h[:grades].length)  >= 75
    }
end
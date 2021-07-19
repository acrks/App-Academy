def hipsterfy(word)
    vowels = "aeiou"
    word = word.reverse
    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            return (word[0...idx] + word[idx + 1..-1]).reverse
        end
    end
    return word.reverse
end

def vowel_counts(string)
    hash = Hash.new(0)
    vowels = "aeiou"
    string.each_char do |char|
        if vowels.include?(char.downcase)
            hash[char.downcase] += 1
        end
    end
    return hash
end

def caesar_cipher(str, num)
	new_str = ""
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  alpha_list = alphabet.split("")
  str.each_char do |char|
    ind = alpha_list.index(char)
    if !alphabet.include?(char)
        new_str += char
    else
        new_str += alpha_list[(ind + num) % 26]
    end
  end
  return new_str
end

def first_anagram?(str1, str2)
  str1_arr = str1.split("")
  str1_permutations = str1_arr.permutation.to_a
  str1_permutations.each { |str| return true if str.join("") == str2 }
  false
end

def second_anagram?(str1, str2)
  str2_arr = str2.split("")
  (0...str1.length).each do |i|
    str2_index = str2_arr.find_index(str1[i])
    if str2_index != nil
      str2_arr.delete_at(str2_index)
    else
      return false
    end
  end
  str2_arr.empty?
end

def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end

def fourth_anagram?(str1, str2)
  check = Hash.new(0)
  str1.each_char do |ele|
    check[ele] += 1
  end
  str2.each_char do |ele|
    check[ele] -= 1
  end
  check.values.all? { |ele| ele == 0 }
end

p fourth_anagram?("listen", "silent")
p fourth_anagram?("stressed", "desserts")
p fourth_anagram?("cat", "tac")

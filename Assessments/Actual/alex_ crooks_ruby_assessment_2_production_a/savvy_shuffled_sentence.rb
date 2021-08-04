# Write a method `savvy_shuffled_sentence?` that takes in two sentences.
# The method should return a boolean indicating whether or not the sentences
# consist of the same exact *words*, but not necessarily in the same order.
#
# Your solution should have a linear - O(n) runtime, where n is the combined
# length of the input strings.
#
# Scoring: 8 points maximum
#   4 points awarded for passing all test cases
#   4 points awarded for linear runtime
#
# This component of the assessment is estimated to take 10 minutes.

def savvy_shuffled_sentence?(str1, str2)
    hash = Hash.new(0)
    str1_arr = str1.split
    str2_arr = str2.split

    str1_arr.each do |word|
        hash[word] += 1
    end

    str2_arr.each do |word|
        hash[word] -= 1
    end

    hash.values.all? {|ele| ele == 0}
end


# Test Cases:
p savvy_shuffled_sentence?("there is no spoon", "spoon there is no") # true
p savvy_shuffled_sentence?("I do what I want to do", "I do what to want do I") # true
p savvy_shuffled_sentence?("cellar", "cellar") # true
p savvy_shuffled_sentence?("cellar door", "cellar door") # true
p savvy_shuffled_sentence?("silent", "listen") # false
p savvy_shuffled_sentence?("school master", "the classroom") # false
p savvy_shuffled_sentence?("I do what I want to do", "what I want to do") # false
p savvy_shuffled_sentence?("there is no spoon", "there is one spoon") # false
p savvy_shuffled_sentence?("what the what", "what the") # false
p savvy_shuffled_sentence?("what the", "what the what") # false
p savvy_shuffled_sentence?("thaw the thaw", "what the what") # false

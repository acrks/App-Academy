class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    accumulator ||= self.shift
    self.each do |i|
      accumulator = prc.call(accumulator, i)
    end
    accumulator
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end
  return true
end

def primes(num)
  counter = 0
  n = 2
  arr = []
  while counter < num
    if is_prime?(n)
      arr << n
      counter += 1
    end
    n+=1
  end
  arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  res = factorials_rec(num-1)
  cur = res[-1] * (num-1)
  res << cur
  res
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new() {|k,v| k[v] = []}
    self.each_with_index do |ele, i|
      hash[ele] << i
    end
    hash.select {|k,v| v.count > 1}   
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    new_arr = []
    new_str = ""
    (0...self.length).each do |i|
      (i...self.length).each do |j|
        new_str = self[i..j]
        new_arr << new_str
      end
    end
    new_arr.select {|i| i == i.reverse && i.length > 1}
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    prc ||= Proc.new {|el_1, el_2| el_1 <=> el_2}
    return [] if self.empty?
    return self if  self.length == 1
    mid_length = self.length / 2
    Array.merge(self[0..mid_length], self[mid_length + 1..-1], prc)
  end

  private
  def self.merge(left, right, &prc)
    p prc.call(left, right)
  end
end

class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    arr = self

    accumulator ||= arr.shift

    arr.each do |ele|
        accumulator = prc.call(accumulator, ele)
    end

    accumulator
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0 }
end

def primes(num)
    primes = []

    i = 2
    while primes.length < num
        primes << i if is_prime?(i)

        i += 1
    end

    primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
    return [1] if num == 1

    prev_facts = factorials_rec(num - 1)
    prev_facts << prev_facts.size * prev_facts.last
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices
  # of all duplicate elements. The keys are the duplicate elements; the values
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    indices = Hash.new { |hash, key| hash[key] = [] }

    self.each_with_index do |ele, i|
        indices[ele] << i
    end

    indices.select { |key, value| value.size > 1 }
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    sym_subs = []

    (0...self.length).each do |i|
        (i...self.length).each do |j|
            sub = self[i..j]
            reversed_sub = sub.reverse
            sym_subs << sub if sub == reversed_sub && sub.length > 1
        end
    end

    sym_subs
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your
  # implementation.**

  def merge_sort(&prc)
    return self if self.length <= 1

    prc ||= Proc.new { |a, b| a <=> b }

    mid_idx = self.length / 2
    left_half = self[0...mid_idx]
    right_half = self[mid_idx..-1]

    left = left_half.merge_sort(&prc)
    right = right_half.merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    combined = []

    until left.empty? || right.empty?
        if prc.call(left.first, right.first) == -1
            combined << left.shift
        else
            combined << right.shift
        end
    end

    if left.empty?
        combined += right
    else
        combined += left
    end

    combined
  end
end

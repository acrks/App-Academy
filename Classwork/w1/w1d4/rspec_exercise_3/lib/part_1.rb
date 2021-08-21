def is_prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0 }
end

def nth_prime(n)
    counter = 0
    candidate = 0
    while counter < n
        candidate += 1
        counter += 1 if is_prime?(candidate)
    end
    return candidate
end

def prime_range(min, max)
    return (min..max).select {|i| is_prime?(i)}
end
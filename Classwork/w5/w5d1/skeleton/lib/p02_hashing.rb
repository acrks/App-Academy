class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    # iterate through the array
    ascii_sum = 0
    self.each_with_index do |ele, idx|
      # iterate through each element
      ascii_sum += ele.hash * 10 ** idx
    end
    ascii_sum.hash
    # add the ascii value together for a specific element
    # based on it's index, multiply that total value, 10 ** the element's index in the array
  end
end

class String
  def hash
    ascii_sum = 0
    self.each_byte.with_index do |byte, idx|
      # iterate through each element
      ascii_sum += byte * 10 ** idx
    end
    ascii_sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    ascii_sum = 0
    self.each do |k,v|
      ascii_sum += k.hash + v.hash
    end
    ascii_sum.hash
  end
end
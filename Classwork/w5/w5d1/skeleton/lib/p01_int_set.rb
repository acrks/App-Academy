class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(max) {false}
  end

  def insert(num)
    raise 'Out of bounds' if !is_valid?(num)
    validate!(num)
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num < @max && num >= 0
  end

  def validate!(num)
    @store[num] = true
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count >= @store.length

    if !include?(num)
      @count += 1
      self[num] << num
      return true
    end
  end

  def remove(num)
    if include?(num)
      self[num].clear
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets * 2) { Array.new }

    @store.each do |bucket|
      if !bucket.empty?
        new_bucket_int = bucket.first % new_arr.length
        new_arr[new_bucket_int] << bucket.first
      end
    end
    @store = new_arr
  end

end

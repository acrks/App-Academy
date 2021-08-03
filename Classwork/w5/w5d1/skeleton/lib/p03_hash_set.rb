class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count >= @store.length

    if !include?(key)
      @count += 1
      self[key] << key
      return true
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].clear
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets * 2) { Array.new }

    @store.each do |bucket|
      if !bucket.empty?
        new_bucket_int = bucket.first.hash % new_arr.length
        new_arr[new_bucket_int] << bucket.first
      end
    end
    @store = new_arr
  end
end
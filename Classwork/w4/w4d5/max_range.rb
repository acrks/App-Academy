def windowed_max_range(array, window_size)
  temp_arr = []
  (0..array.length - window_size).each do |i|
    temp_temp = []
    (0...window_size).each do |j|
      temp_temp << array[i + j]
    end
    temp_arr << temp_temp
  end
  temp_arr.map! { |ele| difference(ele) }
  temp_arr.max
end

def difference(array)
  array.max - array.min
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) # 3, 2, 5, 4, 8

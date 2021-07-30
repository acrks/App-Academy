def my_min(arr)
  (0...arr.length).each do |i|
    min = true

    (0...arr.length).each do |j|
      next if arr[i] == arr[j]
      min = false if arr[j] < arr[i]
    end

    return arr[i] if min
  end
end

def my_min2(arr)
  min = arr.first
  (0...arr.length).each do |i|
    min = arr[i] if arr[i] < min
  end
  min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)
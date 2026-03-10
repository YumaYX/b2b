# frozen_string_literal: true

def quick_sort(data)
  return data if data.size <= 1
  pivot = data.shift
  left = []
  right = []

  data.each do |element|
    pivot > element ? (left << element) : (right << element)
  end
  quick_sort(left) + [pivot] + quick_sort(right)
end

data = [5, 3, 4, 0, 2, 9, 6, 8, 7, 1]
p quick_sort(data)

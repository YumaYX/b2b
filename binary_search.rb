# frozen_string_literal: true

def binary_search(data, target)
  min_index = 0
  max_index = data.length - 1

  while min_index <= max_index
    mid_index = min_index + (max_index - min_index) / 2
    standard = data[mid_index]

    if standard == target
      return mid_index
    elsif standard < target
      min_index = mid_index + 1
    else
      max_index = mid_index - 1
    end
  end
  -1
end

data = [0, 1, 34, 56, 78]
data.sort!
p binary_search(data, 34)

cities = %w[fukuoka hiroshima kobe kyoto nagoya osaka sapporo tokyo yokohama]
p binary_search(cities, "sapporo")

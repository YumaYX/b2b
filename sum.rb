# frozen_string_literal: true

def sum(n)
  m = 0
  while n != 1
    m += n
    n -= 1
  end
  m + 1
end

puts sum(10)

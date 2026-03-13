# frozen_string_literal: true

seq = ['ONE', '', '', 'TWO', '', 'THREE', '', '', '',]
seq.push('END')

count = 0
label = ''

index = 0
loop do
  current = seq[index]
  label = current unless current.empty?

  # processing 1
  count += 1

  next_value = seq[index + 1]
  unless next_value.empty?
    # processing 2
    puts "#{label}: #{count}"

    break if next_value.eql?('END')
    # initialize
    count = 0
  end

  index += 1
end

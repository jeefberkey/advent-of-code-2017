require 'pry'

def solve(offsets)
  index = 0
  count = 0
  while offset = offsets[index] do
    offsets[index] += (offsets[index] >= 3 ? -1 : 1)
    index += offset
    count += 1
  end
  count
end

puts solve(%w[0 3 0 1 -3].map(&:to_i))

puts solve(File.readlines('input.txt').map(&:to_i))

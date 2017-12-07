require 'pry'

def redist(ary)
  blocks_to_redist = ary.max
  loc_of_biggest_block = ary.index(blocks_to_redist)
  # puts "redist loc #{loc_of_biggest_block} with val of #{blocks_to_redist}"

  ary[loc_of_biggest_block] = 0
  blocks_to_redist.times do |bank|
    i =  (bank + loc_of_biggest_block + 1) % ary.length
    ary[i] += 1
    blocks_to_redist -= 1
  end
  ary
end

def run(ary)
  original_ary = ary.dup
  results = []
  while results.uniq == results do
    new_ary = redist(ary)
    results << new_ary.dup
  end
  results.length - 1 - results.index(results.last)
end

puts run([0,2,7,0])
puts run(%w{14 0 15 12 11 11 3 5 1 6 8 4 9 1 8 4}.map(&:to_i))

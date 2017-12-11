require 'pry'

# list = (0..4).to_a
# pos  = 0
# skip = 0
# lengths = [3,4,1,5]

list = (0..255).to_a
pos  = 0
skip = 0
lengths = '189,1,111,246,254,2,0,120,215,93,255,50,84,15,94,62'.split(',').map(&:to_i)

def rev_subary(ary, pos, len)
  ary.rotate!(pos)
  ary[0,len] = ary[0, len].reverse
  ary.rotate!(-pos)
end

lengths.each do |l|
  rev_subary(list,pos,l)
  pos += l + skip
  skip += 1
end

p list
puts list[0] * list[1]

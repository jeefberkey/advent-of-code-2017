require 'pry'

def rev_subary(ary, pos, len)
  ary.rotate!(pos)
  ary[0,len] = ary[0, len].reverse
  ary.rotate!(-pos)
end

def knot(input)
  list = (0..255).to_a
  pos  = 0
  skip = 0
  lengths = input
  rounds = 64

  chars = lengths.codepoints.to_a
  chars << [17,31,73,47,23]
  chars.flatten!

  rounds.times do
    chars.each do |l|
      rev_subary(list,pos,l)
      pos += l + skip
      skip += 1
    end
  end

  sparse = []
  list.each_slice(16) do |s|
    sparse << eval(s.join(' ^ ')).to_s(16)
  end

  sparse.join
end

puts knot('')
puts knot('AoC 2017')
puts knot('1,2,3')
puts knot('1,2,4')
puts knot('189,1,111,246,254,2,0,120,215,93,255,50,84,15,94,62')

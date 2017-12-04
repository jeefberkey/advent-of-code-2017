require 'pry'

# https://rosettacode.org/wiki/Ulam_spiral_(for_primes)#Ruby
# :)
def cell(n, x, y, start=1)
  y, x = y - n/2, x - (n - 1)/2
  l = 2 * [x.abs, y.abs].max
  d = y >= x ? l*3 + x + y : l - x - y
  (l - 1)**2 + d + start - 1
end

def int_to_array(n)
  spiral = []

  n.times do |y|
    row = []
    n.times do |x|
      i = cell(n,x,y)
      next if i > n
      # print format % i
      row << i
    end
    # puts
    spiral << row
  end
  spiral.delete_if { |row| row[0].nil? }
end

def mat_find(matrix, match)
  matrix.each_with_index do |row,x|
    row.each_with_index do |item,y|
      if matrix[x][y] == match
        return [x,y]
      end
    end
  end
end

def manhattan_distance(x1,y1,x2,y2)
  (x1-x2).abs + (y1-y2).abs
end

def day03a(input)
  puts "stop at #{input}"

  spiral = int_to_array(input)

  x1,y1 = mat_find(spiral,1)
  x2,y2 = mat_find(spiral,input)
  puts manhattan_distance(x1,y1,x2,y2)
end

day03a(1)
day03a(12)
day03a(23)
day03a(1024)
# day03a(312051)

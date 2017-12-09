require 'pry'

d = { 'inc' => 1, 'dec' => -1 }

lines = File.readlines('input.txt')

registers = lines.map { |r| r.split(' ').first }
registers.each do |r|
  eval("@#{r} = 0")
end

lines.each do |line|
  var, dir, inc, b, c_1, op, c_2 = line.split(' ')
  eval("@#{var} += #{d[dir]*inc.to_i}") if eval("@#{c_1} #{op} #{c_2}")
end
vars = registers.map { |e| eval("@#{e}") }

puts vars.max

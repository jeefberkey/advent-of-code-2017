require 'pry'

INPUT=12131415

digits = INPUT.to_s.split('')

matches = []
digits.each_with_index do |d,i|
  step   = (digits.length / 2)
  newloc = (i+step) % digits.length
  matches << digits[i].to_i if digits[i] == digits[newloc]
end

puts matches.sum

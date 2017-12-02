require 'pry'

INPUT=12131415

digits = INPUT.to_s.split('')

matches = []
digits.each_with_index do |d,i|
  step = (digits.length / 2)
  newloc = (i+step) % digits.length

  if digits[i] == digits[newloc]
    matches << digits[i].to_i
  end
end

puts matches.sum

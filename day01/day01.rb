require 'pry'

INPUT=91212129

digits = INPUT.to_s.split('')

matches = []
(digits << digits[0]).each_with_index do |d,i|
  if digits[i] == digits[i+1]
    matches << digits[i].to_i
  end
end

puts matches.sum

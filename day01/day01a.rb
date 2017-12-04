require 'pry'

INPUT=91212129

digits = INPUT.to_s.split('')

# easy way
matches = []
(digits << digits[0]).each_with_index do |d,i|
  matches << digits[i].to_i if digits[i] == digits[i+1]
end

# hard way
# matches = (digits << digits[0]).map.with_index { |d,i|
#   digits[i].to_i if digits[i] == digits[i+1]
# }.compact

puts matches.sum

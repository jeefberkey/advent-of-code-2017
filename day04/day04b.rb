require 'pry'

def validate_passphrase(phrase)
  p = phrase.split(' ')
  sorted = p.map do |item|
    item.chars.sort.join
  end
  # binding.pry
  sorted.uniq.length == p.length
end

puts validate_passphrase('abcde fghij')
puts validate_passphrase('abcde xyz ecdab')
puts validate_passphrase('a ab abc abd abf abj')
puts validate_passphrase('iiii oiii ooii oooi oooo')
puts validate_passphrase('oiii ioii iioi iiio')

valid = 0
File.readlines('passphrases.txt').each do |phrase|
  valid += 1 if validate_passphrase(phrase)
end

puts valid

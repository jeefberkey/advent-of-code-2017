require 'pry'

def parse(str)
  s = str.chars
  index = 0
  score = 0

  results = []
  per_score = 0
  gerbidge = false

  while index < str.length
    if s[index] == '!'
      index += 1
    elsif gerbidge
      if s[index] == '>'
        gerbidge = false
      end
    elsif s[index] == '{'
      per_score += 1
      results << per_score
    elsif s[index] == '<'
      gerbidge = true
    elsif s[index] == '}'
      per_score -= 1
      score += results.pop
    end
    index += 1
  end
  p score
end

parse('{}') # 1
parse('{{{}}}') # 6
parse('{{},{}}') # 5
parse('{{{},{},{{}}}}') # 16
parse('{<a>,<a>,<a>,<a>}') # 1
parse('{{<ab>},{<ab>},{<ab>},{<ab>}}') # 9
parse('{{<!!>},{<!!>},{<!!>},{<!!>}}') # 9
parse('{{<a!>},{<a!>},{<a!>},{<ab>}}') # 3
parse(File.read('input.txt'))

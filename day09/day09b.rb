require 'pry'

def parse(str)
  s = str.chars
  index = 0
  score = 0

  results = []
  per_score = 0
  gerbidge = false
  g_count = 0

  while true
    break if index >= str.length
    if s[index] == '!'
      index += 1
    elsif gerbidge
      if s[index] == '>'
        gerbidge = false
      else
        g_count += 1
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
  p g_count
end

parse('<>') # 0
parse('<random characters>') # 17
parse('<<<<>') # 3
parse('<{!>}>') # 2
parse('<!!>') # 0
parse('<!!!>>') # 0
parse('<{o"i!a,<{i<a>') # 10
parse(File.read('input.txt'))

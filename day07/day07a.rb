require 'pry'
require 'graphviz'

weights = {}
data = {}
g = GraphViz.new('day07', type: :graph)

File.readlines('test.txt').each do |line|
  if line.chomp.include? '->'
    front, back = line.chomp.split(' -> ')
    children = back.split(', ')
  else
    front = line.chomp
    children = nil
  end
  name, weight = front.split(' ')
  weights[name] = weight.gsub(/\(|\)/,'').to_i

  # data[name] = {
  #   name: name,
  #   children: children,
  #   weight: weight.gsub(/\(|\)/,'').to_i
  # }

  g.add_node(name)
  if children
    children.each do |c|
      g.add_edges(name,c)
    end
  end
end

# data.each do |node,vals|
#   next unless vals[:children]
#   parent_weight = weights[node]
#   children_weights = []
#   vals[:children].each do |c|
#     children_weights << weights[c]
#   end
#
#   if children_weights.uniq.length > 1
#     puts "#{node}: #{parent_weight} | c: #{vals[:children].zip(children_weights)}"
#   end
# end

g.output(svg: 'wat.svg')

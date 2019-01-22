class Node
  getter name, edges

  def initialize(@name : String)
    @edges = {} of Node => Float64
  end

  def add_edge(node, weight)
    @edges[node] = weight
  end

  def ==(other : Node)
    name == other.name
  end

  def !=(other : Node)
    name != other.name
  end
end

def dijkstras_path(start : Node, goal : Node)
  closed_set = [] of Node
  open_set = [start]
  came_from = {} of Node => Node
  g_score = {} of Node => Float64
  g_score[start] = 0.0

  f_score = {} of Node => Float64
  f_score[start] = 0.0

  while !open_set.empty?
    current = open_set.min_by { |n| f_score.fetch(n, Float64::INFINITY) }

    return reconstruct_path(came_from, current) if current == goal

    open_set.delete(current)
    closed_set << current

    current.edges.keys.each do |neighbor|
      next if closed_set.includes?(neighbor)

      tentative_g_score = g_score.fetch(current, Float64::INFINITY) + current.edges[neighbor]

      if !open_set.includes?(neighbor)
        open_set << neighbor
      elsif tentative_g_score >= g_score.fetch(neighbor, Float64::INFINITY)
        next
      end

      came_from[neighbor] = current
      g_score[neighbor] = tentative_g_score
      f_score[neighbor] = g_score.fetch(neighbor, Float64::INFINITY)

    end
  end

  raise Exception.new("Failed to find path")
end

def reconstruct_path(came_from, current)
  total_path = [current]
  while came_from.keys.includes?(current)
    current = came_from[current]
    total_path << current
  end

  total_path.reverse
end


#######
# basic usage
#######

start = Node.new("start")
mid1 = Node.new("mid1")
mid2 = Node.new("mid2")
goal = Node.new("goal")

start.add_edge(mid1, 2.0)
start.add_edge(mid2, 3.0)
mid1.add_edge(goal, 20.0)
mid2.add_edge(goal, 7.0)

path = dijkstras_path(start, goal)
p path.map { |n| n.name }

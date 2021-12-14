require 'pry'
class Part1

  attr_reader :input, :coords

  def initialize
    @input =
    @coords = {}
  end


  def parse_points
    lines = []
    input.each do |line|
      points = line.split(" -> ")
      point1 = points.first.split(",")
      left = {x: point1.first.to_i, y: point1.last.to_i}
      point2 = points.last.split(",")
      right = {x:point2.first.to_i, y:point2.last.to_i}
      lines.push([left, right])
    end

    lines.each do |line|
      x1 = line.first[:x]
      y1 = line.first[:y]
      x2 = line.last[:x]
      y2 = line.last[:y]

      if x1 == x2
        ([y1, y2].min..[y1,y2].max).step(1) do |step|
          mark(coords, x1, step)
        end
      elsif y1 == y2
        ([x1, x2].min..[x1,x2].max).step(1) do |step|
          mark(coords, step, y1)
        end
      else
        puts "This would be a diagonal line"
      end
    end
    coords.values.count {|v| v >=2 }
  end

  def mark(coords, x, y)
    coords[[x, y]] = coords.fetch([x, y], 0) + 1
  end

end

p = Part1.new
puts p.parse_points


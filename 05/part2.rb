require 'pry'
class Part2

  attr_reader :input, :coords

  def initialize
    @input = File.readlines("input2.txt", chomp: true)
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
        xInc = x1 > x2 ?  -1:1
        yInc = y1 > y2 ? -1:1
        startX = x1
        startY = y1

        while startX != x2
          mark(coords, startX, startY)
          startX +=xInc
          startY += yInc
        end
        mark(coords, startX, startY)
      end
    end
    coords.values.count {|v| v >=2 }
  end

  def mark(coords, x, y)
    coords[[x, y]] = coords.fetch([x, y], 0) + 1
  end

end

p = Part2.new
puts p.parse_points


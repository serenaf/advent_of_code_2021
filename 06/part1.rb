require 'pry'
class Part1
  attr_accessor :fishies

  def initialize
    @fishies = File.read("input.txt").split(",").map(&:to_i)
  end

  def simulate_fishies(days)
    i = 0
    while i < days
      original_length = fishies.size
      fishies.each_with_index do |fish, index|
        if index < original_length
          case fish
          when 0
            fishies[index] = 6
            fishies << 8
          when 1..8
            fishies[index] = fish-1
          end
        end
      end
      i+=1
    end
    fishies.size
  end

end

p = Part1.new
puts p.simulate_fishies(18)



















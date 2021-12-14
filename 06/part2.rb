require 'pry'
class Part2
  attr_accessor :fishies

  def initialize
    @fishies = File.read("input2.txt").split(",").map(&:to_i)
  end

  def initialize_hash(hash)
    i = 0
    while i < 9
       hash[i] = 0
      i += 1
    end
    hash
  end

  def simulate_fishies(days)
    fishies_hash = initialize_hash(Hash.new)
    new_fishies_hash = initialize_hash(Hash.new)

    fishies.each do |fish|
      fishies_hash[fish] +=1
    end

    ticker = 0
    while ticker < days
      new_fishies_hash[0] = fishies_hash[1]
      new_fishies_hash[1] = fishies_hash[2]
      new_fishies_hash[2] = fishies_hash[3]
      new_fishies_hash[3] = fishies_hash[4]
      new_fishies_hash[4] = fishies_hash[5]
      new_fishies_hash[5] = fishies_hash[6]
      new_fishies_hash[6] = fishies_hash[7] + fishies_hash[0]
      new_fishies_hash[7] = fishies_hash[8]
      new_fishies_hash[8] = fishies_hash[0]

      fishies_hash = new_fishies_hash
      new_fishies_hash = initialize_hash(Hash.new)
      ticker +=1
    end
    sum = 0
    fishies_hash.values.each do |value|
      sum +=value
    end
    sum
  end

end

p = Part2.new
puts p.simulate_fishies(256)

















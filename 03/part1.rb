class Part1
  attr_reader :input

  def initialize
    @input = File.readlines("input.txt", chomp: true)
  end


  def determine_power_consumption
    power_bits = []

    input.each do |line|
      line.chars.each_with_index do |bit, index|
        if power_bits[index].nil?
          power_bits[index] = bit == '1' ? 1 : 0
        elsif bit == '1'
          power_bits[index] += 1
        end
      end
    end
    gamma_rate = ''
    epsilon_rate = ''

    power_bits.each do |bit_position|
      gamma_rate += bit_position > (input.size / 2) ? '1' : '0'
      epsilon_rate += bit_position > (input.size / 2) ? '0' : '1'
    end
    gamma_rate.to_i(2) * epsilon_rate.to_i(2)
  end
end


p = Part1.new
puts p.determine_power_consumption

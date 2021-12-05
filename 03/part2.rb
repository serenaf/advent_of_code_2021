require 'pry'
class Part2
  attr_reader :input

  def initialize
    @input = File.readlines("input2.txt", chomp: true)
  end

  def determine_bit_array(numbers)
    power_bits = []

    numbers.each do |line|
      line.chars.each_with_index do |bit, index|
        if power_bits[index].nil?
          power_bits[index] = bit == '1' ? 1 : 0
        elsif bit == '1'
          power_bits[index] += 1
        end
      end
    end
    power_bits
  end

  def determine_ogygen_generator_rating
    numbers = input.dup
    index = 0

    while numbers.length > 1
      power_bits = determine_bit_array(numbers)
      numbers = determine_ogygen_generator_rating_number(numbers, power_bits, index)
      index += 1
    end
    #we have to continue this now for all other positions
    numbers.first
  end

  def determine_ogygen_generator_rating_number(numbers, power_bits, index)
     # determine the most common number in position index
     number_of_ones = power_bits[index]
     number_of_zeroes = numbers.size - number_of_ones

     if number_of_ones >= number_of_zeroes
      numbers.select! { |number| number[index] == '1' }
     else
      numbers.select! { |number| number[index] == '0' }
     end
    numbers
  end

  def determine_co2_scrubber_rating
    numbers = input.dup
    index = 0

    while numbers.length > 1
      power_bits = determine_bit_array(numbers)
      numbers = determine_co2_generator_rating_number(numbers, power_bits, index)
      index += 1
    end
    #we have to continue this now for all other positions
    numbers.first
  end

  def determine_co2_generator_rating_number(numbers, power_bits, index)
    # determine the most common number in position index
    number_of_ones = power_bits[index]
    number_of_zeroes = numbers.size - number_of_ones

    if number_of_zeroes <= number_of_ones
     numbers.select! { |number| number[index] == '0' }
    else
     numbers.select! { |number| number[index] == '1' }
    end
   numbers
 end



end


p = Part2.new
ogygen_generator_rating = p.determine_ogygen_generator_rating
co2_scrubber_rating = p.determine_co2_scrubber_rating
puts ogygen_generator_rating.to_i(2) * co2_scrubber_rating.to_i(2)

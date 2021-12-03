class Part1

  def initialize
    @input =  File.readlines("input2.txt", chomp: true)
    @position1 = []
    @position2 = []
    @position3 = []
    @position4 = []
    @position5 = []
    @position6 = []
    @position7 = []
    @position8 = []
    @position9 = []
    @position10 = []
    @position11 = []
    @position12 = []


    @input.each do |line|
      @position1 << line[0]
      @position2 << line[1]
      @position3 << line[2]
      @position4 << line[3]
      @position5 << line[4]
      @position6 << line[5]
      @position7 << line[6]
      @position8 << line[7]
      @position9 << line[8]
      @position10 << line[9]
      @position11 << line[10]
      @position12 << line[11]
    end

    @position1.join(",").to_i
    @position2.join(",").to_i
    @position3.join(",").to_i
    @position4.join(",").to_i
    @position5.join(",").to_i
    @position6.join(",").to_i
    @position7.join(",").to_i
    @position8.join(",").to_i
    @position9.join(",").to_i
    @position10.join(",").to_i
    @position11.join(",").to_i
    @position12.join(",").to_i

  end

  def determine_gamma_rate
    gamma_rate= []

    gamma_rate << @position1.max_by {|pos| @position1.count(pos) }
    gamma_rate << @position2.max_by {|pos| @position2.count(pos) }
    gamma_rate << @position3.max_by {|pos| @position3.count(pos) }
    gamma_rate << @position4.max_by {|pos| @position4.count(pos) }
    gamma_rate << @position5.max_by {|pos| @position5.count(pos) }
    gamma_rate << @position6.max_by {|pos| @position6.count(pos) }
    gamma_rate << @position7.max_by {|pos| @position7.count(pos) }
    gamma_rate << @position8.max_by {|pos| @position8.count(pos) }
    gamma_rate << @position9.max_by {|pos| @position9.count(pos) }
    gamma_rate << @position10.max_by {|pos| @position10.count(pos) }
    gamma_rate << @position11.max_by {|pos| @position11.count(pos) }
    gamma_rate << @position12.max_by {|pos| @position12.count(pos) }


    gamma_rate.join("").to_i(2)
  end

  def determine_epsilon_rate
    epsilon_rate= []
    epsilon_rate << @position1.min_by {|pos| @position1.count(pos) }
    epsilon_rate << @position2.min_by {|pos| @position2.count(pos) }
    epsilon_rate << @position3.min_by {|pos| @position3.count(pos) }
    epsilon_rate << @position4.min_by {|pos| @position4.count(pos) }
    epsilon_rate << @position5.min_by {|pos| @position5.count(pos) }
    epsilon_rate << @position6.min_by {|pos| @position6.count(pos) }
    epsilon_rate << @position7.min_by {|pos| @position7.count(pos) }
    epsilon_rate << @position8.min_by {|pos| @position8.count(pos) }
    epsilon_rate << @position9.min_by {|pos| @position9.count(pos) }
    epsilon_rate << @position10.min_by {|pos| @position10.count(pos) }
    epsilon_rate << @position11.min_by {|pos| @position11.count(pos) }
    epsilon_rate << @position12.min_by {|pos| @position12.count(pos) }
    epsilon_rate.join("").to_i(2)
  end

end


p = Part1.new
puts p.determine_gamma_rate
puts p.determine_epsilon_rate
puts p.determine_gamma_rate * p.determine_epsilon_rate

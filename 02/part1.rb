class Part1

  attr_reader :input, :position, :depth

  def initialize
    @input =  File.readlines("input2.txt", chomp: true)
    @position = 0
    @depth = 0
  end

  def move_submarine
    input.each do |line|
      # split on a single whitespace
      command, argument = line.split(/ /)
      case command
      when "forward"
        @position += argument.to_i
      when "down"
        @depth += argument.to_i
      when "up"
        @depth -= argument.to_i
      else raise "Unknown command"
      end
    end
  end
end

p = Part1.new
p.move_submarine
puts p.position
puts p.depth
puts p.position * p.depth

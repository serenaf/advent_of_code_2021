require 'pry'

class Board
  attr_reader :rows, :columns, :marked_numbers

  def initialize(rows)
    @rows = rows
    @columns = rows.transpose
    @marked_numbers = []
  end

  def mark_number(number)
    marked_numbers << number
    rows.each do |row|
     row.delete(number)
    end
    columns.each do |column|
      column.delete(number)
    end
  end

  def bingo_completed?
    rows.any?(&:empty?) || columns.any?(&:empty?)
  end

  def sum_unmarked_numbers
    rows.map(&:sum).sum
  end
end

class Part1

  attr_reader :input, :boards
  attr_accessor :bingo_numbers

  def initialize
    @input = File.readlines("input2.txt", chomp: true)
  end

  def parse_input
    @bingo_numbers = input.first.split(',').map(&:to_i)
    rows = []
    @boards = []

    input.drop(1).each do |line|
      if line.empty?
        @boards << Board.new(rows) unless rows.empty?
        rows = []
      else
        rows << line.split(' ').map(&:to_i)
      end
    end
    boards << Board.new(rows) unless rows.empty?
  end

  def play_bingo
    winning_number = 0
    winner_board = nil
    bingo_numbers.each do |number|
      boards.each do |board|
        board.mark_number(number)
      end
      if boards.any?(&:bingo_completed?)
        winning_number = number
        break
      end
    end
    winner_board = boards.find { |b| b.bingo_completed? }
    puts winning_number
    puts winner_board.sum_unmarked_numbers
    puts winner_board.sum_unmarked_numbers * winning_number
  end

end

p = Part1.new
p.parse_input
puts p.play_bingo

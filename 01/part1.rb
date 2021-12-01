input =  File.readlines("input.txt", chomp: true).map(&:to_i)

i = 1
increment = 0
while i < input.length do
  increment += 1 if input[i] > input[i-1]
  i += 1
end

puts increment

input =  File.readlines("input.txt", chomp: true).map(&:to_i)


sliding_window_arrays = input.each_cons(3).to_a
sum_array = []
sliding_window_arrays.each do |swa|
  sum = 0
  swa.each do |element|
    sum +=element
  end
  sum_array << sum
end

i = 1
increment = 0
while i < sum_array.length do
  increment += 1 if sum_array[i] > sum_array[i-1]
  i += 1
end

puts increment

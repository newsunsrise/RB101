def multiply(numbers_array, multiplier)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers_array.size

    multiplied_numbers << numbers_array[counter] * multiplier
    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) 

p my_numbers
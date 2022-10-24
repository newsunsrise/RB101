ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages_array = []
ages.each_value { |value| ages_array << value }
sum = ages_array.sum

puts sum
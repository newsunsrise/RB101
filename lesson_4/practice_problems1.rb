flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

counter = 0
flintstones_hash = {}

loop do 
  break if counter >= flintstones.size
  name = flintstones[counter]
  index = flintstones.index(name)
  flintstones_hash[name] = index
  
  counter += 1
end

p flintstones_hash
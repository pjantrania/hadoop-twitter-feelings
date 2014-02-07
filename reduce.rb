#!/usr/bin/env ruby

## Reduce task
## Outputs a message based on the sign
## of the map output

message = "The world is feeling %s"

# accumulator for sentiment values
sum = 0

# loop over each line of input
ARGF.each do |line|
  
  # remove the trailing newline
  line = line.chomp

  # separate the key from the value
  (key, value) = line.split(/\t/)

  # add the sentiment value to the accumulator
  sum += value.to_i
end

if sum < 0
  puts sum.to_s + "\t" + (message % "sad...")
elsif sum > 0
  puts sum.to_s + "\t" + (message % "happy!")
else
  puts sum.to_s + "\t" + (message % "so-so.")
end

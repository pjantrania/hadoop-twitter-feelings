#!/usr/bin/env ruby

## Map task
## Counts each occurrence of positive words,
## subtracts the count of negative words,
## and outputs the difference


# list of words with a positive meaning
positive_words = ["happy"]
# list of words with a negative meaning
negative_words = ["sad"]

# sum of word counts
sum = 0

# dummy output key
key = "1"

# loop over each line of input
ARGF.each do |line|
  # remove trailing newline
  line = line.chomp

  # ignore blank lines
  next if !line || line.length < 2
  
  # add the count of positive words to the sum
  positive_words.each do |word|
    sum += line.scan(word).length
  end

  # subtract the count of negative words to the sum
  negative_words.each do |word|
    sum -= line.scan(word).length
  end
end

# output the net "sentiment"
puts key + "\t" + sum.to_s

# Script to download tweets from the Twitter stream.
# Creates multiple files with ~100 tweets each,
# up to a total of 10 000 tweets.

require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key       = "consumer key"
  config.consumer_secret    = "consumer secret"
  config.oauth_token        = "oauth token"
  config.oauth_token_secret = "oauth secret"
  config.auth_method        = :oauth
end

client = TweetStream::Client.new
count_tweets = 0
count_files = 0
output_file = File.open("tweets-#{count_files}.in", "w")
tweets = Array.new

Thread.new do
  while true
    if tweets.count > 100
      output_file.puts tweets.join("\n")
      tweets.clear
      count_files += 1
      output_file.close
      output_file = File.open("tweets-#{count_files}.in", "w")
    else
      sleep(5)
    end
  end
end

client.sample do |status, conn|
    
  if status.lang == "en"
    tweets.push("#{status.text}")
    count_tweets += 1
  end
  if count_tweets > 10000
    conn.stop
  end
end

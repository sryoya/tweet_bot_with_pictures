namespace :twitter do
  desc "random_tweet"
  task :tweet => :environment do
    twitter_client
    tweet = Tweet.order('rand()').first
    status = tweet.text
    media = open(tweet.image)
    @client.update_with_media(status, media)
    # query = "#サンタコス"
    # results = @client.search(query, count: 100, result_type: "recent",  exclude: "retweets", filter: "images")
    # results.take(15).each do |tw|
    #   @client.favorite(tw.id)
    # end
  end
end


 def twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "LJe8VYCCEAOKOQ1HVwYOG2TOZ"
      config.consumer_secret = "4gDqshtdMdmeO9Ksr6RcXXpGY8L4x9lcwEp8MINZ2K2kySxZL7"
      config.access_token = "4433840233-n0LkrUghJpVpYYSPANoilTsiRheaLH2R4GNejip"
      config.access_token_secret = "ydguCbqcWNHiIUVB5byMQ9drEYJM2oR5gsQhJ8gud4mnL"
    end
end
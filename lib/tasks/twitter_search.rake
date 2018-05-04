namespace :twitter_search do
  desc "favorite_santa_tweet"
  task :tweet_search => :environment do
    twitter_client
    query = "#サンタコス"
    results = @client.search(query, count: 100, result_type: "recent",  exclude: "retweets", filter: "images")
    results.take(100).each do |tw|
      # @client.favorite(tw.id)
      image = tw.media.first.expanded_url.to_s
      text = "#サンタコス"
      tweet = Tweet.where(image: image, text: text).first_or_initialize
      tweet.save
    end
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
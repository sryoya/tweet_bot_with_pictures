class TweetsController < ApplicationController
  before_action :twitter_client, except: :new
  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(create_params)
    redirect_to :root
  end

  def post
    tweet = Tweet.order('rand()').first
    status = tweet.text
    media = open(tweet.image)
    @client.update_with_media(status, media)
    redirect_to :root
  end

 def twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = Settings.twitter[:consumer_key]
      config.consumer_secret = Settings.twitter[:consumer_secret]
      config.access_token = Settings.twitter[:access_token]
      config.access_token_secret = Settings.twitter[:access_token_secret]
    end
  end

  def image_template
    if self.class == String
      tf = Tempfile.new
      tf.print(file_data.read)
      tf.rewind
    else
      return self
    end
      # ext = File.extname(url)
      # name = File.basename(url, ext)
      # Tempfile.new([name, ext])
  end

  private
  def create_params
    params.require(:tweet).permit(:text, :image)
  end
end

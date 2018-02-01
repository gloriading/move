class FeedBuilder
  attr_accessor :user

  # FEED_URL = "http://www.healthworksfitness.com/feed"
  # FEED_URL = "https://www.nataliejillfitness.com/feed"
  FEED_URL = "http://feeds.feedburner.com/anytimefitnessofficial"

  def initialize(user)
    @user = user
  end

  def feed
    begin
      # retrieve the RSS news feed
      parsed_feed = Feedjira::Feed.fetch_and_parse(FEED_URL)
      # parsed_feed is an array of objects
      # map through it to get things i need and return it
      parsed_feed.entries.map do |entry|
        {
          title: entry.title,
          url: entry.url,
          content: entry.content
        }
      end
    rescue
      []
    end
  end

end

class WelcomeController < ApplicationController

  # services/feed_builder.rb
  # views/welcome/index.html.erb
  def index
    @feeds = FeedBuilder.new(current_user).feed
    @shares = Share.all.order(updated_at: :desc)
  end
end

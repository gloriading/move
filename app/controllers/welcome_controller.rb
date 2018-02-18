class WelcomeController < ApplicationController

  # services/feed_builder.rb
  # views/welcome/index.html.erb
  def index
    @feeds = FeedBuilder.new(current_user).feed
  end
end

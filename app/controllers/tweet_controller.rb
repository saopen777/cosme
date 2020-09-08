class TweetController < ApplicationController
  def index
    @tweet = Tweet.all
  end
end

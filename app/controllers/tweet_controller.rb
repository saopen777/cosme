class TweetController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_with_http_digest

  def index
    @tweet = Tweet.all.order("created_at DESC")
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.valid?
      @tweet.save
    redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :text, :content, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end

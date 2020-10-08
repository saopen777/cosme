class TweetController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_with_http_digest

  def index
    @tweet = Tweet.includes(:user).order("created_at DESC")
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


  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comment = @tweet.comments.includes(:user)
  end

  def new
    @tweet = Tweet.new
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :text, :content, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end

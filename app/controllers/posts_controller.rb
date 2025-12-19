class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.where("published_at IS NOT NULL").order(published_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def feed
    @posts = Post.where("published_at IS NOT NULL").order(published_at: :desc).limit(20)
    respond_to do |format|
      format.rss { render :feed }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end

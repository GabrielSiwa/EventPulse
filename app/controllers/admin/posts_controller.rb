module Admin
  class PostsController < Admin::ApplicationController
    before_action :set_post, only: %i[show edit update destroy]

    def index
      @posts = Post.order(published_at: :desc)
    end

    def show; end

    def new
      @post = Post.new
    end

    def edit; end

    def create
      @post = Post.new(post_params)
      # Ensure published_at is set to the creation time and not requested from the form
      @post.published_at ||= Time.current
      if @post.save
        redirect_to admin_post_path(@post), notice: "Post created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @post.update(post_params)
        redirect_to admin_post_path(@post), notice: "Post updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @post.destroy
      redirect_to admin_posts_path, notice: "Post deleted."
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      # Do not permit :published_at from the admin form — it's set automatically on create
      params.require(:post).permit(:title, :body, :url)
    end
  end
end

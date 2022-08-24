class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.recent_posts
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
    @params = params
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_post_path(id: @post.id, user_id: @post.author_id), notice: 'Post was successfully created.'
    else
      render :new, alert: 'Error occurred, Post not saved'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author_id)
  end
end

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id).includes(comments: [:author])
  end

  def new
    @user = current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.create!(params.require(:post)
      .permit(:title, :text)
      .merge(author_id: current_user.id,
             comments_counter: 0,
             likes_counter: 0))
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: @post }
        end
      end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(comments: [:author]).find(params[:id])
  end
end

class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Story '#{@post.title}' created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Story '#{@post.title}' updated!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Story deleted"
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :story)
  end

end

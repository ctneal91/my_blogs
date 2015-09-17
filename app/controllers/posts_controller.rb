class PostsController < ApplicationController
  def list
    @posts = Post.all
  end

  def detail
    @post = Post.find params[:id]
  end

  def new
    @post= Post.new
  end

  def create
    @post = Post.new params.require(:post).permit(:title, :body)
   if @post.save
     redirect_to root_path
   else
     render :new
   end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update params.require(:post).permit(:title, :body)
      redirect_to root_path
    else
      render :edit
    end
  end

end

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
  end
end

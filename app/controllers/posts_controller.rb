class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end
  
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.create post_params
  	if @post.save
  		redirect_to @post
  		flash[:notice] = "New Post created!"
  	else
  		render 'new'
  	end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update post_params
  		redirect_to @post
  		flash[:notice] = "Post updated!"
  	else
  		render 'edit'
  	end

  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.delete
  	redirect_to posts_path
  	flash[:notice] = "Post deleted!"
  end

  private

  def post_params
  	params.require(:post).permit(:title, :description)
  end

end

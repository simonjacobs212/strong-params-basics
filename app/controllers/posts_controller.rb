class PostsController < ApplicationController
	before_action :set_post, only: [:show, :update, :edit]

	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params(:title, :description))
		@post.save
		redirect_to post_path(@post)
	end
	  
	def update
		@post.update(post_params(:title))
		redirect_to post_path(@post)
	end
	  
	private
	  
	  
	  # We pass the permitted fields in as *args;
	  # this keeps `post_params` pretty dry while
	  # still allowing slightly different behavior
	  # depending on the controller action. This
	  # should come after the other methods
	  
	def post_params(*args)
		params.require(:post).permit(*args)
	end
	
	def set_post
		@post = Post.find(params[:id])
	end
end

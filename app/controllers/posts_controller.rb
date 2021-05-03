class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def new
		@post = Post.new
	end

	def create
		# binding.pry
		@post = Post.new(post_params)
		if @post.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def update
		if @post.update_attributes(post_params)
			redirect_to posts_path
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	def show
    @comment = Comment.new
	end

	def index
 		@posts = Post.all
	end

	private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:title, :body, :author)
  end

end
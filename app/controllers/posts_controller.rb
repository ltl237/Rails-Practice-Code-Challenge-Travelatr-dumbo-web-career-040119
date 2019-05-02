class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def show
		@post = get_post
		@post_blogger = @post.blogger

		# byebug
		# redirect_to @post
	end

	def create
		@post = Post.create(post_params)

		redirect_to @post
	end

	def edit
		get_post
	end

	def update
		# @post.likes += 1
		# @post.update
		# @post.increment!(:likes, by = 1)
		get_post.update(post_params)
		redirect_to @post
	end

	def liked_post
		@post = get_post
		if @post.likes 
			@post.likes += 1
		else
			@post.likes = 1
		end
		@post.save
		redirect_to post_path(@post)
	end

	private

	def get_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title,:content,:likes,:blogger_id,:destination_id)
	end

	# def increase_like
	# 	@post = get_post
	# 	@post.likes += 1
	# 	@post.save
	# end
end
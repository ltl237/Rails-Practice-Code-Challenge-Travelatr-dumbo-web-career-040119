class BloggersController < ApplicationController


	def index
		@bloggers = Blogger.all
	end

	def new
		@blogger = Blogger.new
	end

	def create
		@blogger = Blogger.create(blogger_params)
		# byebug
		redirect_to @blogger
	end

	def show
		# get_blogger
		@most_likes = get_blogger.posts.maximum(:likes)
		@post_with_most_likes = get_blogger.posts.find_by(likes: @most_likes)
		byebug
	end

	def destroy
		Blogger.destroy(get_blogger.id)
		redirect_to bloggers_path
	end

	private

	def get_blogger
		@blogger = Blogger.find(params[:id])
	end

	def blogger_params
		params.require(:blogger).permit(:name,:bio,:age)
	end


end
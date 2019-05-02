class DestinationsController < ApplicationController
	before_action :get_dest, only: [:show,:edit,:update]

	def index
		@destinations = Destination.all

	end


	def show
		@last_five_posts = @destination.posts.order(created_at: :desc).limit(5)
		@initial = 0
		@destination.bloggers.each do |blogger| (
			@initial += blogger.age
		)
		end
		@avg_age = @initial / @destination.bloggers.count
		# redirect_to @destination
	end



	private

	def get_dest
		@destination = Destination.find(params[:id])
	end
end
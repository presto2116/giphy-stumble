class FavoritesController < ApplicationController

	def index
		@favorites = current_user.favorites.all
	@interests = current_user.interests.all
		@interest = current_user.interests.new
	end

	def show
		@favorite = current_user.favorites.find( params[:id])
		@interests = current_user.interests.all
		@interest = current_user.interests.new
	end

	def create
		@new_fav_gif = current_user.favorites.find_or_create_by(gif_url: params[:my_data])
		render nothing: true
	end

	def destroy
		@favorite = current_user.favorites.find( params[:id])
		@favorite.destroy
		redirect_to favorites_path
	end

end
class FavoritesController < ApplicationController

	def index
		@favorites = current_user.favorites.all
	end

	def show
		@favorite = current_user.favorites.find( params[:id])
	end

	def create
		@new_fav_gif = current_user.favorites.create(gif_url: params[:my_data])
		render nothing: true
	end

end
class FavoritesController < ApplicationController
	def index
		@favorites = current_user.favorites.all
	end

	def show
		@favorite = current_user.favorite.find( params[:id])
	end

end
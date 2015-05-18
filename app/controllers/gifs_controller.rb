class GifsController < ApplicationController
	
	def random_interest
			interest = ["best", "happy", "puppy", "dog", "space", "football", "apple", "monkey", "animal", "pizza", "funny",  "cute", "sleeping", "tiger", "favorites", "cat", "food", "sports", "tv", "movie", "batman", "dinosaur",   "Golden-Retriever", "beach", "snow", "rain", "mountain", "snowboard", "skateboard", "car", "giraffe", "fail", "Washington-DC", "science", "astronomy", "art", "Star-Wars", "Star-Trek", "80s", "90s"]
			@random_interest = interest.sample
			return @random_interest
	end

	def index
		if current_user
			@interests = current_user.interests.all
			@interest = current_user.interests.all
		else
			@interests = Interest.all
			@interest = Interest.all
		end
		secret_key = ENV['secret_key']
		interest_query = random_interest
		
		response = HTTParty.get("http://api.giphy.com/v1/gifs/search?q=#{interest_query}&api_key=#{secret_key}&limit=116")
		@response = response.merge('current_interest' => interest_query.capitalize)
		
		respond_to do |format|
			format.html { render :index }
			format.json { render json: @response}
		end
	end

	def show


	end

end
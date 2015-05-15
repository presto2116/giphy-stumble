class GifsController < ApplicationController
	
	def random_interest
			interest = ["best", "southpark", "happy", "puppy", "dog", "simpsons", "space", "football", "apple", "geek", "monkey", "animal", "pizza", "cheese", "funny", "lol", "hilarious", "beer", "whiskey", "wasted", "alligator", "cute", "adorable", "sleeping", "loop", "viral", "tiger", "reaction", "favorites", "cat", "food", "sports", "tv", "movie", "batman", "wine", "banana", "dinosaur", "github", "coding", "hacking", "milkshake", "hotdog", "golden-retriever", "beach", "snow", "rain", "mountain", "snowboard", "skateboard", "crazy", "car", "bike", "motorcycle", "giraffe", "fail", "colorado", "washington-dc", "shanghai", "cheeseburger", "sandwich", "pasta", "noodles", "china",  "internet",  "science", "astronomy", "art", "tornado", "lizard", "scary", "drunk", "drinking", "music", "band", "star-wars", "star-trek", "80s", "90s", "tired", "bored", "hungry", "stressed"]
			@random_interest = interest.sample
			return @random_interest
	end

	def index
		@interests = Interest.all
		@interest = Interest.new
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
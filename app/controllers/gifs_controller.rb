class GifsController < ApplicationController
	
	def random_interest
			interest = ["best", "southpark", "happy", "puppy", "dog", "simpsons", "space", "football", "apple", "geek", "monkey", "animal", "pizza", "cheese", "funny", "lol", "hilarious", "beer", "whiskey", "wasted", "alligator", "cute", "adorable", "sleepy", "loop", "viral", "tiger", "reaction", "favorites", "top100", "cat", "food", "sports", "tv", "movie", "batman", "wine", "banana", "dinosaur", "fword", "github", "ruby", "programming", "coding", "hacking", "rubyonrails", "fml", "omg", "milkshake", "hotdog", "goldenretriever", "beach", "snow", "rain", "mountain", "snowboard", "skateboard", "crazy", "Trex", "car", "bike", "motorcycle", "giraffe", "fail", "subaru", "colorado", "dc", "shanghai", "macbook", "cheeseburger", "sandwich", "pasta", "noodles", "chinese", "spain", "spanish", "internet", "webdevelopment", "science", "astronomy", "telescope", "art", "3d", "tornado", "lizard", "scary", "drunk", "drinking", "partying", "phish", "music", "band", "starwars", "startrek", "rofl", "orangejuice", "80s", "90s", "2000", "y2k"]
			@random_interest = interest.sample
			return @random_interest
	end

	def index
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
class InterestsController < ApplicationController
	# TRYING TO GET IT TO LOCK IN CATEGORY SEARCH WORD
	def interest
			return "happy"
	end

	def index
		secret_key = ENV['secret_key']
			interest_query = interest

		response = HTTParty.get("http://api.giphy.com/v1/gifs/search?q=#{interest_query}&api_key=#{secret_key}&limit=116")
		@response = response.merge('current_interest' => interest_query.capitalize)
		
		respond_to do |format|
			format.html { render :index }
			format.json { render json: @response}
		end
	end


end
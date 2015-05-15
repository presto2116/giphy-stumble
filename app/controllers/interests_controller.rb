class InterestsController < ApplicationController
	# TRYING TO GET IT TO LOCK IN CATEGORY SEARCH WORD
	
	def interest
		return "happy"
	end

	def new
		@interest = Interest.new
		@interests = Interest.all
	end

	def create
		@interests = current_user.interests.all
		@interest = current_user.interests.find_or_create_by(interest_params)
		if @interest.save
			redirect_to @interest
		else
			redirect_to root_path
		end
	end

	def index
		@interests = current_user.interests.all
	end
	def show
		@interest = current_user.interests.find( params[:id])
		@interests = current_user.interests.all

			interest_query = @interest.interest
		secret_key = ENV['secret_key']

		response = HTTParty.get("http://api.giphy.com/v1/gifs/search?q=#{interest_query}&api_key=#{secret_key}&limit=116")
		@response = response.merge('current_interest' => interest_query.capitalize)

		
		respond_to do |format|
			format.html { render :show }
			format.json { render json: @response}
		end
	end
	def update
		@interests = current_user.interests.all
		@interest = current_user.interests.find( params[:id])
	end

	private

		def interest_params
				params.require(:interest).permit(:interest)
		end


end
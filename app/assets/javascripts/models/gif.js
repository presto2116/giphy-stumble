
function Gif(gif_url) {
	this.gif_url = gif_url;
}

	var randomNum = function(){
		return parseInt(Math.floor(Math.random() * 100));
		
	}
Gif.prototype = {
	fetchGif: function(){
		return $.ajax({
			url: "/gifs",
			method: "get",
			dataType: "json"
		}).done(function(response){
			this.gif_url = response.data[randomNum()].images.original.url;
			//BIG NO NO! global variable!
			current_interest = response.current_interest;
			//BIG NO NO! global variable!
		}.bind(this));
	},
	addFavorite: function(){
		return this.gif_url;
	}
}
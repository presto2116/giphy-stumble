
function Gif(gif_url) {
	this.gif_url = gif_url;
}

	var randomNum = function(){
		num = parseInt(Math.floor(Math.random() * 100));
		return num;
	}
	console.log(randomNum());
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
			//BIG NO NO! global variable
		}.bind(this)).fail(function(response){
			console.log("ajax failed to load");
		});
	},
	interestGif: function(){
		return $.ajax({
			url: "/interests",
			method: "get",
			dataType: "json"
		}).done(function(response){
			this.gif_url = response.data[randomNum()].images.original.url;
			//BIG NO NO! global variable!
			current_interest = response.current_interest;
			//BIG NO NO! global variable
		}.bind(this));
	}
}



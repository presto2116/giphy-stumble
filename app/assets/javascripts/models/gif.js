
function Gif(gif_url) {
	this.gif_url = gif_url;
}

	var randomNum = function(length){
		num = parseInt(Math.floor(Math.random() * (length)));
		return num;
	}

Gif.prototype = {
	fetchGif: function(){
		return $.ajax({
			url: "/gifs",
			method: "get",
			dataType: "json"
		}).done(function(response){
			var length = response.data.length;
			this.gif_url = response.data[randomNum(length)].images.original.url;
			//BIG NO NO! global variable!
				console.log(randomNum(length));
			Gif.prototype.current_interest = response.current_interest;
			//BIG NO NO! global variable
		}.bind(this)).fail(function(response){
			console.log("ajax failed to load");
		});
	},
	interestGif: function(){
		return $.ajax({
			url: window.location.pathname,
			method: "get",
			dataType: "json"
		}).done(function(response){
			var length = response.data.length;
			console.log("click");
			this.gif_url = response.data[randomNum(length)].images.original.url;
			//BIG NO NO! global variable!
			current_interest = response.current_interest;
			//BIG NO NO! global variable
		}.bind(this));
	}
}



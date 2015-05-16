function GifView() {
	$('#giphy-stumble').on('click', this.gifStumble.bind(this));
	$('#interest-stumble').on('click', this.interestStumble.bind(this));
	$('#add-favorite').on('click', this.addToFavorites.bind(this));
	$('#gif-root').on('click', this.gifStumble.bind(this));
	$('#gif-interest').on('click', this.interestStumble.bind(this));
}

GifView.prototype = {
	gifStumble: function() {
		this.model = new Gif();
		console.log("clicked");
		$('#add-favorite').css("background", "#007095");

		this.model.fetchGif().done(function(){
			this.render();
		}.bind(this));
	},
	interestStumble: function(){
		this.model = new Gif();
		$('#add-favorite').css("background", "#007095");
		this.model.interestGif().done(function(){
			this.render();
		}.bind(this));
	},
	addToFavorites: function(){
		$('#add-favorite').css("background", "green");
		var count = parseInt($('#favorite-count').text()) + 1;
		$("#favorite-count").text(count);
			$.ajax({
				url: "/favorites",
				method: "post",
				data: {
					my_data: this.model.gif_url
				}
			})
	
	},

	render: function(){
		$("#gif-interest").css("background-image", 'url(' + this.model.gif_url + ')');
		$("#gif-root").css("background-image", 'url(' + this.model.gif_url + ')');
		$("#interest").text("Category: " + current_interest);
		
	},
	copyToClipboard: function(text) {
  window.prompt("Copy to clipboard: Cmd+C, Enter", text);
}
}






function GifView() {
	$('#giphy-stumble').on('click', this.gifStumble.bind(this));
	$('#gif').on('click', this.gifStumble.bind(this));
	$('#add-favorite').on('click', this.addToFavoirtes.bind(this));
}

GifView.prototype = {
	gifStumble: function() {
		this.model = new Gif();
		this.model.fetchGif().done(function(){
			this.render();
		}.bind(this));
	},
	addToFavoirtes: function(){
		console.log(this.model.gif_url);
		this.render2();
	},
	render: function(){
		$("#gif").css("background-image", 'url(' + this.model.gif_url + ')');
		$("#interest").text("Category: " + current_interest);
	},
	render2: function(){
		$("#interest").text(this.model.gif_url);
	}
}
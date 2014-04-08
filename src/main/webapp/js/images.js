define(['jquery'], function($) {

	console.log("entering images functions");
	
	return {
		preloadImages: function (detailImgId) {
			$("img.preloaded").each(function(index, element) {		
				
				var url = $(element).next().text();
				$.get( url, function( data ) {
					console.log(url + " loaded");
				});
				
				$(element).click(function(e) {
					e.preventDefault();
					$("#" + detailImgId).attr("src", url);
				});
			});
		}
	};

});

define(['jquery'], function($) {

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
		},
		waitForLoad: function (processErrorImgUrl, errorImgUrl, maxAttemptsNr, timeout) {
			
			$("img.wait_for_load").each(function(index, element) {
				var imgUrl = $(element).attr("src");
				loadImage($(element), imgUrl, processErrorImgUrl, errorImgUrl, 0, maxAttemptsNr, timeout);				
			});
			
		}
	};
	
	function loadImage(img, imgUrl, processErrorImgUrl, errorImgUrl, attempts, maxAttemptsNr, timeout) {
		console.log("loading image: " + imgUrl);
		$.ajax({
			url: imgUrl,
			success: function(data) {
				console.log("successfully loaded image: " + imgUrl + ". setting attr.");
				window.setTimeout(function() {
					img.attr("src", imgUrl);
				}, 1000);
			},
			error: function(xhr, status, error) {				
				if (attempts < maxAttemptsNr) {
					img.attr("src", processErrorImgUrl);
					console.log("error in loading image: " + imgUrl + ". attempts: " + attempts + ". setting loader and trying next attempt.");
					window.setTimeout(function() {
						loadImage(img, imgUrl, processErrorImgUrl, errorImgUrl, ++attempts, maxAttemptsNr, timeout);
					}, timeout);					
				} else {
					img.attr("src", errorImgUrl);
					console.log("error in loading image: " + imgUrl + ". attempts: " + attempts + ". setting error image.");
				}
			}
		});
	}

});

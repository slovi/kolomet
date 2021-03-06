define(['jquery'], function($) {

	var PRELOAD_IMG_ATTR = 'preload-img';
	
	return {
		preloadImages: function (detailImgId) {
			$("img.preloaded").each(function(index, element) {		
				
				var detailUrl = $(element).next().text();
				var origUrl = $(element).next().next().text();
				$.get( detailUrl, function( data ) {
					console.log(detailUrl + " loaded");
				});
				
				$(element).click(function(e) {
					e.preventDefault();
					var detailImg = $("#" + detailImgId); 
					detailImg.data(PRELOAD_IMG_ATTR, detailUrl);
					var fileLoaderUrl = detailImg.data('loader-url');
					var fileNotFoundUrl = detailImg.data('not-found-url');
					loadImage(detailImg, detailUrl, fileLoaderUrl, fileNotFoundUrl, 0, 4, 2000);	
					var parentElement = detailImg.parent();
					if (parentElement.is("a")) {
						parentElement.attr("href", origUrl);
					}
				});
			});
		},
		
		waitForLoad: function (processErrorImgUrl, errorImgUrl, maxAttemptsNr, timeout) {
			
			this.waitForImagesLoad($("img.wait_for_load"), processErrorImgUrl, errorImgUrl, maxAttemptsNr, timeout);
			
		},
		
		waitForImagesLoad: function (elements, processErrorImgUrl, errorImgUrl, maxAttemptsNr, timeout) {
			
			elements.each(function(index, element) {
				var imgUrl = $(element).data(PRELOAD_IMG_ATTR);
				loadImage($(element), imgUrl, processErrorImgUrl, errorImgUrl, 0, maxAttemptsNr, timeout);				
			});
		}
	};
	
	function loadImage(img, imgUrl, processErrorImgUrl, errorImgUrl, attempts, maxAttemptsNr, timeout) {
		console.log("loading image: " + imgUrl);
		$.ajax({
			url: createResultUrl(imgUrl, attempts),
			success: function(data) {
				console.log("successfully loaded image: " + imgUrl + ". setting attr.");
				img.attr('src', imgUrl);
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
	
	function createResultUrl(imgUrl, attempt) {
		if (imgUrl.indexOf('?') > 0) {
			return imgUrl + '&attempt=' + attempt;
		} else {
			return imgUrl + '?attempt=' + attempt;
		}
	}

});

require(['../common'], function (common) {

	require(['main_default_public'], function(mainDefaultPublic) {
		
		require(['lightbox', 'images', 'fb'], function(lightbox, images, fb) {
			
			$(document).ready(function() {
			
				var detailImage = $('img#detail_image');
				var fileLoaderUrl = detailImage.data('loader-url');
				var fileNotFoundUrl = detailImage.data('not-found-url');
				images.waitForImagesLoad(detailImage, fileLoaderUrl, fileNotFoundUrl, 4, 2000);
				
		    	images.preloadImages('detail_image');
		    	
		    	function postToFeed(title, desc, url, image) {
		    	    var obj = {method: 'feed',link: url, picture: image,name: title,description: desc};
		    	    function callback(response) {}
		    	    FB.ui(obj, callback);
		    	}

		    	var fbShareBtn = document.querySelector('.fb_share');
		    	fbShareBtn.addEventListener('click', function(e) {
		    	    e.preventDefault();
		    	    var title = fbShareBtn.getAttribute('data-title'),
		    	        desc = fbShareBtn.getAttribute('data-desc'),
		    	        url = fbShareBtn.getAttribute('href'),
		    	        image = fbShareBtn.getAttribute('data-image');
		    	    postToFeed(title, desc, url, image);
		    	    return false;
		    	});

			});
	    	
	    });
	
	});

});

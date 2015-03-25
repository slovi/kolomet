require(['../common'], function (common) {

	require(['main_default_public'], function(mainDefaultPublic) {
		
		require(['lightbox', 'images'], function(lightbox, images) {
			
			$(document).ready(function() {
			
				var detailImage = $('img#detail_image');
				var fileLoaderUrl = detailImage.data('loader-url');
				var fileNotFoundUrl = detailImage.data('not-found-url');
				images.waitForImagesLoad(detailImage, fileLoaderUrl, fileNotFoundUrl, 4, 2000);
				
		    	images.preloadImages('detail_image');

			});
	    	
	    });
	
	});

});

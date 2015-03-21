require(['../common'], function (common) {

	require(['main_default_public'], function(mainDefaultPublic) {
		
		require(['lightbox', 'images', 'fb'], function(lightbox, images, fb) {
			
			$(document).ready(function() {
			
				var detailImage = $('img#detail_image');
				var fileLoaderUrl = detailImage.data('loader-url');
				var fileNotFoundUrl = detailImage.data('not-found-url');
				images.waitForImagesLoad(detailImage, fileLoaderUrl, fileNotFoundUrl, 4, 2000);
				
		    	images.preloadImages('detail_image');
		    	
		    	fb.init();
	    	
			});
	    	
	    });
	
	});

});

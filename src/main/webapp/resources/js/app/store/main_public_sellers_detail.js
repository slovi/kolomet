require(['../common'], function (common) {
	
	require(['main_default_public'], function(mainDefaultPublic) {
		
	    require(['lightbox', 'images'], function(lightbox, images) {
	    	
	    	var detailImage = $('img#detail_image');
			var fileLoaderUrl = detailImage.data('loader-url');
			var fileNotFoundUrl = detailImage.data('not-found-url');
			images.waitForImagesLoad(detailImage, fileLoaderUrl, fileNotFoundUrl, 4, 2000);
			
	    });
	
	});

});

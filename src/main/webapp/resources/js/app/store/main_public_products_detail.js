require(['../common'], function (common) {

	require(['main_default_public'], function(mainDefaultPublic) {
		
		require(['lightbox', 'images'], function(lightbox, images) {
			
	    	images.preloadImages('detail_image');
	    	
	    });
	
	});

});

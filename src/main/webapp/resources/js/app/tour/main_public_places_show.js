require(['../common'], function (common) {
	
	require(['main_default_public'], function(mainDefaultPublic) {
		
	    require(['lightbox', 'images', 'ajax-submit', 'fb', 'place-banners', 'http-service'], function(lightbox, images, ajaxSubmit, fb, placeBanners, httpService) {
	    	
		    	$(document).ready(function() {
		    	
		    	images.preloadImages('detail_image');
		    	
		    	var detailImage = $('img#detail_image');
				var fileLoaderUrl = detailImage.data('loader-url');
				var fileNotFoundUrl = detailImage.data('not-found-url');
				images.waitForImagesLoad(detailImage, fileLoaderUrl, fileNotFoundUrl, 4, 2000);
		    	
				placeBanners.render();
				
		    	for (var i = 0; i < 5; i++) {		    		
		    		
		    		ajaxSubmit.decorateId(
		    				'rate_' + i, 
		    				'click', 
		    				function(element, params) {
		    					params.fragments = 'body';
		    					return params;
		    				},
		    				function(element, params) {
		    			
				    			images.preloadImages('detail_image');
				    			
				    			var detailImage = $('img#detail_image');
								var fileLoaderUrl = detailImage.data('loader-url');
								var fileNotFoundUrl = detailImage.data('not-found-url');
				    			images.waitForImagesLoad(detailImage, fileLoaderUrl, fileNotFoundUrl, 4, 2000);
				    			
						    	$('div.comment_box > div.comment_box_text_content > div.comment_box_text, div.detail_description').each(function(index, element) {
						    		var el = $(element);
						    		el.html(el.html().replace(/\n/g, '<br/>'));
						    	});
				    			
						    	fb.init();
						    	
				    		});
		    	}
		    	
		    	$('div.comment_box > div.comment_box_text_content > div.comment_box_text, div.detail_description').each(function(index, element) {
		    		var el = $(element);
		    		el.html(el.html().replace(/\n/g, '<br/>'));
		    	});
		    	
		    	$('#beenThereInput').click(function() {
		    		var placeId = $(this).data('place-id');
		    		var beenThere = $(this).is(':checked');
		    		httpService.send(window.app.contextPath + 'tour/public/places/assign', 'POST', {placeId: placeId, beenThere: beenThere}, function() {});
		    	});
		    	
		    	fb.initShareButtons('.fb_share');
	    	});
	    	
	    });
	
	});

});
require(['../common'], function (common) {
	
	require(['main_default_public'], function(mainDefaultPublic) {
		
	    require(['lightbox', 'images', 'ajax-submit', 'fb'], function(lightbox, images, ajaxSubmit, fb) {
	    	
	    		fb.init();
	    		
		    	$(document).ready(function() {
		    	
		    	images.preloadImages('detail_image');
		    	
		    	var detailImage = $('img#detail_image');
				var fileLoaderUrl = detailImage.data('loader-url');
				var fileNotFoundUrl = detailImage.data('not-found-url');
				images.waitForImagesLoad(detailImage, fileLoaderUrl, fileNotFoundUrl, 4, 2000);
		    	
		    	for (var i = 0; i < 5; i++) {		    		
		    		
		    		ajaxSubmit.decorateId('rate_' + i, 'click', function(element, modelFragmentsData) {
		    			
		    			images.preloadImages('detail_image');
		    			
		    			var detailImage = $('img#detail_image');
						var fileLoaderUrl = detailImage.data('loader-url');
						var fileNotFoundUrl = detailImage.data('not-found-url');
		    			images.waitForImagesLoad(detailImage, fileLoaderUrl, fileNotFoundUrl, 4, 2000);
		    			
				    	$('div.comment_box > div.comment_box_text_content > div.comment_box_text, div.detail_description').each(function(index, element) {
				    		var el = $(element);
				    		el.html(el.html().replace(/\n/g, '<br/>'));
				    	});
		    			
		    		}, {fragments: 'body'});
		    	}
		    	
		    	$('div.comment_box > div.comment_box_text_content > div.comment_box_text, div.detail_description').each(function(index, element) {
		    		var el = $(element);
		    		el.html(el.html().replace(/\n/g, '<br/>'));
		    	});
	    	});
	    	
	    });
	
	});

});
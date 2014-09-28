require(['../common'], function (common) {
	
	require(['main_default_public'], function(mainDefaultPublic) {
		
	    require(['lightbox', 'images', 'ajax-submit'], function(lightbox, images, ajaxSubmit) {
	    	
	    	images.preloadImages('detail_image');
	    	
	    	for (var i = 0; i < 5; i++) {
	    		ajaxSubmit.decorateId('rate_' + i, 'click', function(element, modelFragmentsData) {}, {fragments: 'body'});
	    	}
	    	
	    	$('div.comment_box > div.comment_box_text_content > div.comment_box_text, div.detail_description').each(function(index, element) {
	    		var el = $(element);
	    		el.html(el.html().replace('\n', '<br/>'));
	    	});
	    	
	    });
	
	});

});
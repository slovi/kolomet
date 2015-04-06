define(['http-service', 'jquery'], function(httpService, $) {
	
	return {
		
		render: function(params) {
			httpService.sendGetJson(window.app.contextPath + 'tour/public/places/partners', params, function(data) {
	    		var links = data;
	    		if (links) {
	    			var partnerLinks = $('#partners_links');
	    			partnerLinks.empty();
	    			for (var i = 0; i < links.length; i++) {
	    				partnerLinks.append('<div class="partner_link">' + unescape(links[i].text) + '</div>');
	    			}
	    		}
	    	});
		}
	};
	
});
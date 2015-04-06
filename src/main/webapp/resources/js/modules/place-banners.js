define(['http-service', 'jquery'], function(httpService, $) {
	
	return {
		
		render: function(params) {
			httpService.sendGetJson(window.app.contextPath + 'tour/public/places/banners', params, function(data) {
	    		var links = data;
	    		if (links) {
	    			var newsItemElement = $('div.news_items');
	    			newsItemElement.empty();
	    			for (var i = 0; i < links.length; i++) {
	    				newsItemElement.append('<div class="news_item"><p><span class="news_item_content">' + unescape(links[i].text) + '</span></p></div>');
	    			}
	    		}
	    	});
		}
	};
	
});
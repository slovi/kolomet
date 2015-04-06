define(['jquery', 'facebook'], function($) {
	
	return {
		
		init: function() {
			
			console.log('Init FB API as appId: ' + window.app.facebookAppId);
			
			FB.init({
				appId: window.app.facebookAppId,
				xfbml: true
			});
			
		},
	
		initShareButtons: function(selector) {
			
	    	function postToFeed(title, desc, url, image) {
	    	    var obj = {method: 'feed',link: url, picture: image,name: title,description: desc};
	    	    function callback(response) {}
	    	    FB.ui(obj, callback);
	    	}

	    	var fbShareBtn = $(selector);
	    	if (fbShareBtn) {
		    	fbShareBtn.click(function(e) {
		    	    e.preventDefault();
		    	    var title = fbShareBtn.attr('data-title'),
		    	        desc = fbShareBtn.attr('data-desc'),
		    	        url = fbShareBtn.attr('href'),
		    	        image = fbShareBtn.attr('data-image');
		    	    postToFeed(title, desc, url, image);
		    	    return false;
		    	});
	    	}
			
		}
	
	};
	
});	
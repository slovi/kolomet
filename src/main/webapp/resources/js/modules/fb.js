define(['jquery', 'facebook'], function($) {
	
	return {
		
		init: function() {
			
			console.log('Init FB API as appId: ' + window.app.facebookAppId);
			
			FB.init({
				appId: window.app.facebookAppId,
				cookie: true,
				xfbml: true,
				status: true,
				version: 'v2.3'
			});
			
		},
		
		initSharerButtons: function(selector) {
			
			$(selector).click(function(event) {
			    event.preventDefault();
			    window.open($(this).attr("href"), "Facebook share", "width=600,height=600,scrollbars=yes");
			});
			
		},
	
		initShareButtons: function(selector) {			
			
	    	function postToFeed(title, desc, url, image) {
	    	    var obj = {method: 'feed',link: url, picture: image,name: title,description: desc};
	    	    function callback(response) {}
	    	    FB.ui(obj, callback);
	    	}

	    	var fbShareBtn = $(selector);
	    	var initFb = this.init;
	    	
	    	if (fbShareBtn) {
		    	fbShareBtn.click(function(e) {
		    	    
		    		e.preventDefault();
		    			
	    			FB.logout(function(response) {
	    				FB.login(function(response) {
	    					var title = fbShareBtn.attr('data-title'),
	    					desc = fbShareBtn.attr('data-desc'),
	    					url = fbShareBtn.attr('href'),
	    					image = fbShareBtn.attr('data-image');
	    					postToFeed(title, desc, url, image);
	    					return false;
	    				});
	    			});
		    	    
		    	});
	    	}
			
		}
	
	};
	
});	
define(['jquery', 'facebook'], function($) {
	
	return {
		
		init: function() {
			
			console.log('Init FB API as appId: ' + window.app.facebookAppId);
			
			FB.init({
				appId: window.app.facebookAppId,
				xfbml: true
			});
			
		}
	
	};
	
});	
require(['../common'], function (common) {
	
	// detail
    require(['side_menu', 'login', 'fb'], function(sideMenu, login, fb) {
    	
    	fb.init();
    	
    	sideMenu.prepare();
    	
    	login.prepare();
    	
    	setInterval(animateStoreButton, 5000);
    	
    	function animateStoreButton() {
	    	$('#i_places').animate({
	    		opacity: 0.2
	    	}, 2000, function() {
	    		$('#i_places').animate({
	    			opacity: 1
	    		}, 2000, function() {})
	    	});
    	}
    	
    });
});

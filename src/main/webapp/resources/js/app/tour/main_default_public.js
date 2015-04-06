require(['../common'], function (common) {
	
    require(['login', 'fb'], function(login, fb) {

    	fb.init();
    	
    	login.prepare();
    	
    	$('#i_place_new.anonymous').click(function(event) {
    		event.preventDefault();
    		$("#login_modal").click();
    	});
    	
    	$('#comment_button.anonymous').click(function(event) {
    		event.preventDefault();
    		$("#login_modal").click();
    	});
    	
    	$('#comments_box .comment_box .comment_box_response a.anonymous').click(function(event) {
    		event.preventDefault();
    		$("#login_modal").click();
    	});
    	
    	setInterval(animateStoreButton, 5000);
    	
    	function animateStoreButton() {
	    	$('#i_bikes').animate({
	    		opacity: 0.2
	    	}, 2000, function() {
	    		$('#i_bikes').animate({
	    			opacity: 1
	    		}, 2000, function() {})
	    	});
    	}
    	
    });
    
});

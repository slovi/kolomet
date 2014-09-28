require(['../common'], function (common) {
	
	require(['main_default_public'], function(mainDefaultPublic) {
		
	    require(['input-file', 'jquery'], function(inputFile, $) {
	    	
	    	inputFile.decorateId('profileFiles', {});
	    	
	    });
	
	});

});
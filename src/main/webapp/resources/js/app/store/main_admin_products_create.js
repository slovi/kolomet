require(['../common'], function (common) {
	
	require(['main_default_admin', 'input-file'], function(mainDefaultPublic, inputFile) {
		
		require(['form'], function(form) {
			
	    	inputFile.decorateId('product_files', {});
    		
			form.computeDifferenceOnKeyUp('_finalPrice_id', '_price_id', '_discount_id');
			
    	});
	
	});

});
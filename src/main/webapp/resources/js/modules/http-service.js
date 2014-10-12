define(['jquery', 'loader'], function($, loader) {
	
	return {
		
		send: function(url, method, data, success) {
			
			$.ajax({
		        url: url,
		        type: method,
		        data: data,
		        beforeSend: function(xhr) {
		        	
		        	loader.show();
		        	
		        },
		        success: function(data) {		    
					
					loader.hide();
					success(data);
		        },
		        error: function(xhr, status, errorThrown) {
		        	
		        	loader.hide();
		        	if (data.jqXHR.responseJSON) {
		        		alert('Error: ' + xhr.responseJSON.ajaxError.errorDescription);
		        	} else {
		        		alert('Error: ' + errorThrown);
		        	}
		        },
		        complete: function(xhr) {
		        	
		        	// complete request
		        }
			});
			
		},
		
		sendAndRerender: function(url, method, paramsData, success) {
			
			if (!paramsData.paramsArray) {
				paramsData.paramsArray = [];
			}
			
			paramsData.paramsArray.push({name: 'ajaxSource', value: paramsData.ajaxSource});
			paramsData.paramsArray.push({name: 'fragments', value: paramsData.fragments});
			paramsData.paramsArray.push({name: 'modelFragments', value: paramsData.modelFragments});
			
			$.ajax({
		        url: url,
		        type: method,
		        data: paramsData.paramsArray,
		        beforeSend: function(xhr) {
		        	
		        	loader.show();
		        	
		        },
		        success: function(data) {
		        	
		        	var nodes = $(data);
					
		        	var offset = 0;
		        	if (paramsData.fragments) {
						var fragments = paramsData.fragments.split(',');
						for (var i = 0; i < fragments.length; i++) {
							var fragment = $('#' + $.trim(fragments[i])); 
							fragment.empty();
							fragment.html(nodes[i]);
							offset++;
						}
		        	}
					
		        	var modelFragmentsData = [];
		        	if (paramsData.modelFragments) {
						var modelFragments = paramsData.modelFragments.split(',');
						for (var i = 0; i < modelFragments.length; i++) {
							modelFragmentsData[modelFragments[i]] = $(nodes[i + offset]).text();
						}
		        	}
					
		        	success(modelFragmentsData);
		        	
					loader.hide();
		        },
		        error: function(xhr, status, errorThrown) {
		        	
		        	// show error pane
		        },
		        complete: function(xhr) {
		        	
		        	// complete request
		        }
			});
		}
	};
	
});
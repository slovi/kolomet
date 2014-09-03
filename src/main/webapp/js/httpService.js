define(['jquery', 'loader'], function($, loader) {
	
	return {
		send: function(url, method, paramsData, success) {
			
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
					
					var fragments = paramsData.fragments.split(',');
					var offset = 0;
					for (var i = 0; i < fragments.length; i++) {
						var fragment = $('#' + fragments[i].trim()); 
						fragment.empty();
						fragment.html(nodes[i]);
						offset++;
					}
					
					var modelFragments = paramsData.modelFragments.split(',');
					var modelFragmentsData = [];
					for (var i = 0; i < modelFragments.length; i++) {
						modelFragmentsData[modelFragments[i]] = $(nodes[i + offset]).text();
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
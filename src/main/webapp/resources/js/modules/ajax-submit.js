define(['jquery', 'http-service'], function($, httpService) {
	
	return {
		decorateId: function(id, eventType, paramsCallback, successCallback) {				
			$('#' + id).bind(eventType, function(event) {
				doDecoration($(this), event, paramsCallback, successCallback);
			});
		},
		
		decorate: function(expr, eventType, paramsCallback, successCallback) {
			$(expr).each(function(index, element) {
				$(element).bind(eventType, function(event) {
					doDecoration(element, event, paramsCallback, successCallback);
				});
			});
		}
	};
	
	function doDecoration(element, event, paramsCallback, successCallback) {
		
		if ($(element).attr('type') == 'submit') {
			event.preventDefault();
		}
		
		var closestForm = $(element).closest('form'); 
		var action = closestForm.attr('action');
		var method = closestForm.attr('method');
		
		var formString = closestForm.serialize();
		var params = httpService.deserializeObjectFromUrl(formString);
		params.ajaxSource = $(element).attr('id');
		
		var resultParams = paramsCallback(element, params);
		
		// $.param hack - post data are not converted correctly in case of JSON object
		httpService.sendAndRerender(action, method, resultParams, function() {
			successCallback(element, resultParams);
		});
	}

});
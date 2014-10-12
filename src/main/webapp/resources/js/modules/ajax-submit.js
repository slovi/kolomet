define(['jquery', 'http-service'], function($, httpService) {
	
	return {
		decorateId: function(id, eventType, successCallback, options) {				
			$('#' + id).bind(eventType, function(event) {
				doDecoration($(this), event, successCallback, options);
			});
		},
		
		decorate: function(expr, eventType, successCallback, options) {
			$(expr).each(function(index, element) {
				$(element).bind(eventType, function(event) {
					doDecoration(element, event, successCallback, options);
				});
			});
		}
	};
	
	function doDecoration(element, event, successCallback, options) {
		
		if ($(element).attr('type') == 'submit') {
			event.preventDefault();
		}
		
		var closestForm = $(element).closest('form'); 
		var action = closestForm.attr('action');
		var method = closestForm.attr('method');
		
		var paramsData = {};
		paramsData.paramsArray = closestForm.serializeArray();
		paramsData.fragments = options.fragments;
		paramsData.modelFragments = options.modelFragments;
		paramsData.ajaxSource = $(element).attr('id');
		
		httpService.sendAndRerender(action, method, paramsData, function(modelFragmentsData) {
			successCallback(element, paramsData, modelFragmentsData);
		});
	}

});
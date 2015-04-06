define(['jquery', 'http-service', 'jquery.history'], function($, httpService) {

	return {
		
		decorateId: function(id, eventType, paramsCallback, successCallback) {				
			$('a#' + id).bind(eventType, function(event) {
				doDecoration($(this), event, paramsCallback, successCallback);
			});
		},
		
		decorate: function(expr, eventType, paramsCallback, successCallback) {
			$(expr).each(function(index, element) {
				$(element).bind(eventType, function(event) {
					doDecoration(element, event, paramsCallback, successCallback, history);
				});
			});
		}
	};
	
	function doDecoration(element, event, paramsCallback, successCallback) {
		
		event.preventDefault();
		
		var href = $(element).attr('href');
		var params = httpService.deserializeObjectFromUrl(href);	
		
		var paramsData = paramsCallback(element, params);
		paramsData.ajaxSource = 'a#' + $(element).attr('id');
		
		httpService.sendAndRerender(href, 'GET', paramsData, function() {
			successCallback(element, $.extend(params, paramsData));
		});
	}
	
});
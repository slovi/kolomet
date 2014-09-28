define(['jquery', 'http-service'], function($, httpService) {
	
	return {
		decorateId: function(id, eventType, paramsCallback, successCallback) {				
			$('a#' + id).bind(eventType, function(event) {
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
		
		event.preventDefault();
		
		var href = $(element).attr('href');
		var params = parseQueryString(href);	
		
		var paramsData = paramsCallback(element, params);
		paramsData.ajaxSource = 'a#' + $(element).attr('id');
		
		httpService.sendAndRerender(href, 'GET', paramsData, function(modelFragmentsData) {
			successCallback(element, {params: params, paramsData: paramsData}, modelFragmentsData);
		});
	}
	
	function parseQueryString(url) {
		
		var params = {}, queries, temp, i, l;
		var queryStringIndex = url.indexOf('?');
		var queryString;
		
		if (queryStringIndex > 0) {
			queryString = url.substring(queryStringIndex + 1);
		} else {
			queryString = url;
		}
	 
	    queries = queryString.split("&");
	 
	    for ( i = 0, l = queries.length; i < l; i++ ) {
	        temp = queries[i].split('=');
	        params[temp[0]] = temp[1];
	    }
	 
	    return params;
	}
	
});
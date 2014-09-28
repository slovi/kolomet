define(['jquery', 'mustache'], function($, mustache) {
	
	var cache = {};
	
	return {
		
		loadTemplateHtml: function(template, model) {
			return mustache.render(template, model);
		},
		
		loadHtml: function(templateUrl, model) {
			
			var template = downloadTemplate(cache, templateUrl);
			return mustache.render(template, model);
		}
	
	};	
	
	function downloadTemplate(cache, templateUrl) {
		
		if (cache[templateUrl]) {
			
			return cache[templateUrl];
			
		} else {
			
			var template = '';
			$.ajax({
				url: templateUrl,
				success: function(data) {
					template = data;
				},
				async: false
			});
			cache[templateUrl] = template;
			return template;
		
		}
	}
	
});
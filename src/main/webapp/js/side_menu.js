define(['jquery'], function($) {
	
	console.log('entering side menu module');
	
	return {
		prepare: function() {
			$(".side-menu").each(function(index, element) {
				
				var header = $(".side-menu-header", element);
				var body = $(".side-menu-body", element);
				
				header.click(function() {
					toggleVisibility(body);
					toggleVisibility($(".side-menu-arrow-on", header));
					toggleVisibility($(".side-menu-arrow-off", header));
				});
				
			});
		}
	};
	
	function toggleVisibility(element) {
		if (element.is(":visible")) {
			element.hide();
		} else {
			element.show();
		}
	}
	
});

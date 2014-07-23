define(['jquery'], function($) {
	
	return {
		prepare: function() {
			
			var elements = $(".side-menu"); 
			elements.each(function(index, element) {
			
				toggleMenusVisibility(element, elements);

			});
		}
	};
	
	function toggleMenusVisibility(parentElement, parentElements) {
		
		var header = $(".side-menu-header", parentElement);
		
		header.click(function() {
			
			toggleMenuVisibility(parentElement);
			
			parentElements.each(function(index, element) {
				if (element != parentElement) {
					
					hideMenu(element);
					
				}
			});
			
			window.scrollTo(0, 0);
			
		});
	}
	
	function hideMenu(element) {
		
		var header = $(".side-menu-header", element);
		var body = $(".side-menu-body", element);
		
		body.hide();
		$(".side-menu-arrow-on", header).hide();
		$(".side-menu-arrow-off", header).show();
	}
	
	function toggleMenuVisibility(element) {
		
		var header = $(".side-menu-header", element);
		var body = $(".side-menu-body", element);
		
		toggleVisibility(body);
		toggleVisibility($(".side-menu-arrow-on", header));
		toggleVisibility($(".side-menu-arrow-off", header));
		
	}
	
	function toggleVisibility(element) {
		if (element.is(":visible")) {
			element.hide();
		} else {
			element.show();
		}
	}
	
});

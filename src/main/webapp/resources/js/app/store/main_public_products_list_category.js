require(['../common'], function (common) {

	require(['main_default_public'], function(mainDefaultPublic) {
		
	    require(['form', 'slider', 'ajax-submit'], function(form, slider, ajaxSubmit) {
	    	
	    	// filter form logic
	    	functions = [
				function(resetedForm) {
					window.location.assign($("#products_bikes a").attr("href"));
				}
			];
			
			form.resetForm("filterForm", functions);
			form.ajaxSubmitOnInputChange("filterForm");
	    	
			// sliders
			slider.decorate('#price_slider, #discount_slider, #weight_slider', function(element) {
				$(element).closest("form").find("#button_filter").click();			
			});
			
			// filter form ajax submit
			ajaxSubmit.decorateId('button_filter', 'click', function(element, modelFragmentsData) {}, {fragments: 'body_content'});
			
	    });
	
	});

});
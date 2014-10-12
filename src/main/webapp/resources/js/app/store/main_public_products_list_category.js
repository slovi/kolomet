require(['../common'], function (common) {

	require(['main_default_public'], function(mainDefaultPublic) {
		
	    require(['form', 'slider', 'ajax-submit', 'ajax-link', 'jquery.history'], function(form, slider, ajaxSubmit, ajaxLink, history) {
	    	
	    	History.Adapter.bind(window, 'statechange', function() {
				var State = History.getState();
				History.log('statechange:', State.data, State.title, State.url);
			});
	    	
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
			ajaxSubmit.decorateId(
					'button_filter', 
					'click', 
					function(element, paramsData, modelFragmentsData) {
						pageAndSortLinks();
						History.pushState(null, null, '?' + encodeArrayToQueryString(paramsData.paramsArray));
					}, 
					{fragments: 'body_content'});
			
			// paging
			function pageAndSortLinks() {
				ajaxLink.decorate(
					'div#pages a.page_link, #sort_link_price, #sort_link_discount', 
					'click', 
					function(element, modelFragmentsData) {
						return {fragments: 'body_content'}
					}, 
					function(element, paramsInfo, modelFragmentsData) {		
						pageAndSortLinks();
						History.pushState(null, null, '?' + encodeArrayToQueryString(concatParams(objectToObjectArray(paramsInfo.params), paramsInfo.paramsData.paramsArray)));
					})}
			
			pageAndSortLinks();
			
			function concatParams(array1, array2) {
				var keys = {};
				var newArray = [];
				$.each(array1, function(i, field) {
					if (keys[field.name] != 'exist') {
						newArray.push(field);
					}
					keys[field.name] = 'exist';
				});
				$.each(array2, function(i, field) {
					if (keys[field.name] != 'exist') {
						newArray.push(field);
					}
					keys[field.name] = 'exist';
				});
				return newArray;
			}
			
			function objectToObjectArray(object) {
				var objectArray = [];
				for (key in object) {
					objectArray.push({name: key, value: object[key]});
				} 
				return objectArray;
			}
			
			function encodeArrayToQueryString(params) {
				var urlString = [];
				for (var i = 0; i < params.length; i++) {
					if (params[i].name != 'ajaxSource') {
						urlString.push(params[i].name + '=' + params[i].value);
					}
				}
				return urlString.join('&');
			}
			
	    });
	
	});

});
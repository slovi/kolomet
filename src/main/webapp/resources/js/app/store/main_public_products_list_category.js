require(['../common'], function (common) {

	require(['main_default_public'], function(mainDefaultPublic) {
		
	    require(['form', 'slider', 'ajax-submit', 'ajax-link', 'http-service', 'jquery.history'], function(form, slider, ajaxSubmit, ajaxLink, httpService, history) {
	    	
	    	$(document).ready(function() {
	    		
	    		var excludedHistoryParams = ['ajaxSource', 'fragments'];
	    		
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
						function(element, params) {
							params.fragments = 'body_content';
							return params;
						},
						function(element, params) {
							nextPageAndSortLinks();
							History.pushState(null, 'Kolomet - kola ČR', '?' + httpService.serializeObjectToUrl(params, excludedHistoryParams));
						});
				
				var nextPageAndSortLinks = function() {
					ajaxLink.decorate(
							'div#category_content div:last a.next_page_link', 
							'click',
							function(element, params) {
								params.fragments = 'body_content';
								params.append = true;
								return params;
							},
							function(element, params) {		
								nextPageAndSortLinks();
								$('html,body').animate({scrollTop: $(element).offset().top}, 1000);
								$(element).closest('div').hide();
								//paramsInfo.paramsData.paramsArray.pop();
								History.pushState(null, 'Kolomet - kola ČR', '?' + httpService.serializeObjectToUrl(params, excludedHistoryParams));
							});
							
					ajaxLink.decorate(
							'span#body_content div.sorting a', 
							'click',
							function(element, params) {
								params.fragments = 'body_content';
								return params;
							},
							function(element, params) {		
								nextPageAndSortLinks();
								History.pushState(null, 'Kolomet - kola ČR', '?' + httpService.serializeObjectToUrl(params, excludedHistoryParams));
							});
				
				};
				
				nextPageAndSortLinks();
			
	    	});
			
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
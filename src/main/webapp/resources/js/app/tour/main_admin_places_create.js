require(['../common'], function (common) {
	
	require(['main_default_admin'], function(mainDefaultPublic) {
		
	    require(['async!https://maps.googleapis.com/maps/api/js?key=AIzaSyAbbZrV_w_DmKzCVuFSxgkBs4pvi1gk1VA&amp;sensor=true&amp;language=cs', 'input-file', 'form', 'images', 'template-service', 'jquery'], function(gmaps, inputFile, form, images, templateService, $) {
	    	
	    	var template = '<div class="file_item thumbnail_wrapper"><span>{{name}}</span><div class="thumbnail"><img alt="" src="{{fileThumbUrl}}" /></div></div>';
	    	
	    	var listeners = {
	    			onFileInitialLoadFinish: function(files, configuration) {
	    				if (!files.isEmpty()) {
	    					loadDetailImage(files, images, configuration);
	    					loadThumbnails(files, template);
	    				}
	    			},
	    			onFileUploadDoneFinish: function(files, configuration) {
	    				if (!files.isEmpty()) {
	    					loadDetailImage(files, images, configuration);
	    					loadThumbnails(files, template);
	    				}
	    			},
	    			onFileDeleteFinish: function(files, index, configuration) {
	    				if (!files.isEmpty()) {
	    					loadDetailImage(files, images, configuration);
	    					loadThumbnails(files, template);
	    				}
	    			}
	    	}
	    	
	    	// input file - step 2
	    	inputFile.decorateId('placeFiles', listeners);
	    	
	    	// map - step 1
	    	var markers = [];
	    	
	    	var inputGpsNorth = $("input[name='gpsLocation.north']");
	    	var inputGpsWest = $("input[name='gpsLocation.west']");
	    	
	    	var mapOptions = {};
	    	
	    	var gpsNorth = parseFloat(inputGpsNorth.val().replace(',', '.'));
    		var gpsWest = parseFloat(inputGpsWest.val().replace(',', '.'));
    		
	    	if (gpsNorth && gpsWest) {
	    		mapOptions = {zoom: 8, center: new google.maps.LatLng(gpsNorth, gpsWest)}	    		
	    	} else {
	    		mapOptions = {zoom: 6, center: new google.maps.LatLng(49.8, 15.5)};
	    	}

			var map = new google.maps.Map(document.getElementById('map-canvas-1'), mapOptions);
			
			if (gpsNorth && gpsWest) {
				markers.push(createPlaceMarker(map));
			}
			
			// listener - fill gps values into place input
			google.maps.event.addListener(map, 'click', function(event) {										
				
				if (markers.length > 0) {
					markers[0].setMap(null);
				}
				
				markers = [];
				
				dijit.byId('_gpsLocation.north_id').set('value', event.latLng.lat().toString());
				dijit.byId('_gpsLocation.west_id').set('value', event.latLng.lng().toString());
				
			    map.setCenter(event.latLng);					
			    if (map.getZoom() < 8) {
			    	map.setZoom(8);
			    }
				markers.push(createPlaceMarker(map));					
				
			});
				
	   		// listener - prefil region based on the choosed place in map  
			var geocoder = new google.maps.Geocoder();
			google.maps.event.addListener(map, 'click', function(event) {
				
				var loadDistrict = function(geocoder, districtLoaded) {
					geocoder.geocode({'latLng': event.latLng}, function(results, status) { 
						if (status == google.maps.GeocoderStatus.OK) {
							console.log('returned status ok, resolving district from response.')
							var addressComponents = results[0].address_components;
							$.each(addressComponents, function(addressComponentIndex, addressComponent) {
								$.each(addressComponent.types, function(typeIndex, type) {
									if (type == 'administrative_area_level_1') {
										result = addressComponent.short_name;
										districtLoaded(result);
										
										return;
									}
								});
							});
						} else if (status = google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {
							setTimeout(function() {
								loadDistrict(geocoder, districtLoaded);
								console.log('returned status over_query_limit, next try in one second.')
							}, 1000);							
						} else {
							console.log('error communicating with geocode.')
						}
					});
				}
				
				loadDistrict(geocoder, function(result) {
					$('#_region_id').val(result);
				});
				
			});
			
			Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'step_2_link', event:'onclick'}));
			Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'step_3_link', event:'onclick'}));
			Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'step_1_button', event:'onclick'}));
			Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'step_2_button', event:'onclick'}));
	    
	    	var validForm = true;
	    
	    	dojo.subscribe('step_1_button/validation', function(success) {
	    				validForm = success;
	   				});
	   		dojo.subscribe('step_2_button/validation', function(success) {
	   					validForm = success;
	   				});
	   		dojo.subscribe('step_2_link/validation', function(success) {
	   					validForm = success;
	   				});
	   		dojo.subscribe('step_3_link/validation', function(success) {
	   					validForm = success;
	   				});
	    
	   		var formConfig = {
   				beforeStepListener: function(step) {
   					if (step == 3) {
   	   					if ($('.thumbnails_container').children().length == 1) {
   	   						alert('Není nahrán zadny soubor, neni mozne pokracovat na dalsi krok.');
   	   						return false;
   	   					}
   	   				}
   					return validForm;
   				},
   				afterStepListener: function(step) {
   					if (step == 2) {   	   					   	   					
   	   					
   	   					var step2Map = new google.maps.Map(document.getElementById('map-canvas-2'), mapOptions);
   	   					
   	   					if (markers.length > 0) {
   	   						var marker = markers[0];
   	   						new google.maps.Marker({
   	   							position: marker.getPosition(),
   	   							map: step2Map,
   	   							title: 'Click to zoom'
   	   						});
   	   						step2Map.setCenter(marker.getPosition());
   	   						step2Map.setZoom(8);
   	   					}
   	   				}   	   				   	   			
   				}
	   		}
	   		
   			form.multistepForm(3, formConfig); 
	   		
	   		function loadDetailImage(files, images, configuration) {
	   			var detailImage = $('div#detail_image img'); 
	   			detailImage.data('preload-img', files.getLastFile().fileDetailUrl);
	   			images.waitForImagesLoad(detailImage, configuration.get('fileLoaderUrl'), configuration.get('fileNotFoundUrl'), 4, 2000);
	   		}
	   		
	   		function loadThumbnails(files, template) {
	   			var thumbnailsContainer = $('div#thumbnails'); 
	   			thumbnailsContainer.children().remove();
	   			for (var i = 0; i < files.getSize(); i++) {
	   				var file = files.get(i);
	   				var html = $(templateService.loadTemplateHtml(template, file));
	   				thumbnailsContainer.append(html);
	   			}
	   		}
	   		
	   		function createPlaceMarker(map) {
	   			return new google.maps.Marker({
				    position: map.getCenter(),
				    map: map,
				    title: 'Click to zoom'
				})
	   		}
	    	
	    });
	
	});

});

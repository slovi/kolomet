require(['../common'], function (common) {
	
	require(['main_default_public'], function(mainDefaultPublic) {
		
	    require(['ajax-link', 'ajax-submit', 'async!https://maps.googleapis.com/maps/api/js?key=AIzaSyAbbZrV_w_DmKzCVuFSxgkBs4pvi1gk1VA&amp;sensor=true&amp;language=cs', 'jquery'], function(ajaxLink, ajaxSubmit, gmaps, $) {
	    	
	    	var configHtml = $('#map_config').html();
	    	var config = JSON.parse(configHtml);
	    	
	    	// google map and ajax-enabled side menu	    	
	    	var defaultZoom = 7;
			var defaultRegionZoom = 9;
			var defaultCenter = new google.maps.LatLng(49.8, 15.5); 
			
			var places = config.placesJson;
	    	var placeUrl = config.placeUrl;
	    	var highlightPlaceId = config.highlight;
	    	var contextPath = config.contextPath;
			
			var mapOptions = {
				zoom: defaultZoom,
				center: defaultCenter
			};

			var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
			
			var largeMarkers = false;
			var markers = addPlacesToMap(places, map, largeMarkers);
			
			// ajax submit
			ajaxSubmit.decorate(
					'form#place_filter_form input[type=checkbox]',
					'click',
					function(element, modelFragmentsData) {
						
						removePlaces(markers);
						
						var placesJson = modelFragmentsData['placesJson'];
						if (placesJson) {
							markers = addPlacesToMap(eval(placesJson), map, largeMarkers);
						}
						
					},
					{
						fragments: 'body_footer,body_footer_hidden', 
						modelFragments: 'placesJson'
					}
			);
						
			// ajax links in side menu
			ajaxLink.decorate(
					'div#region-side-menu a.ajaxLink', 
					'click', 
					
					// creates data for ajax link - by serializing checkbox form
					function(element, params) {
				
						var filterForm = $('#place_filter_form');
						var filterRegionInput = $('input[name=region]', filterForm);
						
						filterRegionInput.val('');
						var data = {paramsArray: filterForm.serializeArray(), fragments: 'body_footer,body_footer_hidden', modelFragments: 'placesJson'};
						filterRegionInput.val(params['region']);												
						
						return data;
						
					},
					
					// set h2 text and replace places in google map
					function(element, paramsInfo, modelFragmentsData) {
						
						$("ul#side_menu_body_regions li a").removeClass('current');
						$(element).addClass('current');
						
						removePlaces(markers);
						
						var params = paramsInfo.params; 
						
						if (params['gps_north'] && params['gps_west']) {
							map.setCenter(new google.maps.LatLng(params['gps_north'], params['gps_west']));
							var regionZoom = params['region_zoom'];
							if (regionZoom) {
								map.setZoom(parseInt(regionZoom));
							} else {
								map.setZoom(defaultRegionZoom);
							}
							largeMarkers = true;
						} else {
							map.setCenter(defaultCenter);
							map.setZoom(defaultZoom);
							largeMarkers = false;
						}
						
						var placesJson = modelFragmentsData['placesJson'];
						if (placesJson) {
							markers = addPlacesToMap(eval(placesJson), map, largeMarkers);
						};
						
					});
			
			function removePlaces(markers) {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
			}
			
			function addPlacesToMap(places, map, largeMarkers) {
				
				var markers = [];
				
				for (var i = 0; i < places.length; i++) {
					var place = places[i];
					var highlight = place.id == highlightPlaceId;    					
					
					if (place.gpsLocation) {
						
						var marker;
						if (highlight) {
							var infowindow = new google.maps.InfoWindow({
								content: '<h2 class="title">' + place.name + '</h2>'
							});
							marker = createMarkerFromPlace(place, map, true); 
							infowindow.open(map, marker);
						} else {
							marker = createMarkerFromPlace(place, map, largeMarkers);
						}
						markers.push(marker);
						
						marker.addListener('click', function(marker) {
							window.location.assign(this.url);    						
						});    					
					};
				}
				return markers;
			};
			
			function createMarkerFromPlace(place, map, largeMarkers) {
				return new google.maps.Marker({
				    map: map,
				    draggable: false,
				    position: new google.maps.LatLng(place.gpsLocation.north, place.gpsLocation.west),
				    icon: getMarkerIcon(place, largeMarkers),
				    title: place.name + ' ' + place.id,
				    url: placeUrl + "/" + place.id
				});
			};
			
			function getMarkerIcon(place, largeMarker) {
				var color = place.placeType.placeTypeColor;
				return largeMarker ? 'http://maps.google.com/mapfiles/ms/icons/' + color.toLowerCase() + '-dot.png' : contextPath + '/resources/img/places/' + color + '.png';
			}
	    	
	    });
	
	});

});

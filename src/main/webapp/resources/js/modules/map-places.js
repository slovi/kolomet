define(['async!https://maps.googleapis.com/maps/api/js?key=' + window.app.apiKey + '&amp;sensor=true&amp;language=cs', 'http-service', 'jquery'], 
		function(googleMap, httpService, $) {

	return {
		createMap: function(mapElement, mapOptions) {	
			
			var PlacesMap = function(mapElement, mapOptions) {
				
				this.myPlaces = false;
				this.places = {};
			    this.googleMap = {};
			    this.markers = [];
			    this.params = {};
			    
			}
			
			PlacesMap.prototype = {
			
				init: function(params, success) {

					this.googleMap = new google.maps.Map(mapElement, mapOptions);
					this.params = params;
					var instance = this;
					this.fetchPlaces(params, function(data) {
						instance.places = data.places;
						instance.setMapPosition(params);
						instance.addPlacesToMap(data.places);
						if (success) {
							success(data);
						}
					});
				},
				
			    updateMap: function(params, success) {
			    	
			    	var instance = this;
			    	this.params = params;
			    	this.fetchPlaces(params, function(data) {
			    		instance.removePlaces();
			    		instance.places = data.places;
						if (instance.places) {
							instance.addPlacesToMap(data.places);
							if (success) {
								success(data);
							}
						}
			    	});
				},
			    
			    isMyPlaces: function() {
			    	return this.myPlaces;
			    },
			    
			    updateMapToMyPlaces: function() {
			    	this.removePlaces();
					var myPlacesFilter = function(place) {
						return place.beenThere;
					};
					this.myPlaces = true;
					return this.addPlacesToMap(this.places, myPlacesFilter);
			    },
			    
			    updateMapToAllPlaces: function() {
			    	this.removePlaces();
			    	this.myPlaces = false;
			    	return this.addPlacesToMap(this.places);
			    },
			    
				removePlaces: function() {
					for (var i = 0; i < this.markers.length; i++) {
						this.markers[i].setMap(null);
					}
				},
			    
				setMapPosition: function(params) {
					var north = params.gps_north;
					var west = params.gps_west;
					if (north && west) {
						var regionZoom = params.region_zoom;
						this.googleMap.setCenter(new google.maps.LatLng(north, west));
						if (regionZoom) {
							this.googleMap.setZoom(parseInt(regionZoom));
						} else {
							this.googleMap.setZoom(params.defaultRegionZoom);
						}
					} else {
						this.googleMap.setCenter(new google.maps.LatLng(params.defaultCenterNorth, params.defaultCenterWest));
						this.googleMap.setZoom(params.defaultZoom);
					}
				},
			    
				addPlacesToMap: function(places, placeFilter) {
					
					this.markers = [];
					
					for (var i = 0; i < places.length; i++) {
						var place = places[i];
						var highlight = undefined;
						
						if (this.params.highlight) {
							highlight = place.id === parseInt(this.params.highlight);
						}
						
						if (place.gpsLocation) {
							
							if (!placeFilter || placeFilter(place)) {
								var marker;
								if (highlight) {
									var infowindow = new google.maps.InfoWindow({
										content: '<h2 class="title">' + place.name + '</h2>'
									});
									marker = this.createMarkerFromPlace(place); 
									infowindow.open(googleMap, marker);
								} else {
									marker = this.createMarkerFromPlace(place);
								}
								this.markers.push(marker);
								
								marker.addListener('click', function(marker) {
									window.location.assign(this.url);    						
								});
							}
						};
					}
					
					delete this.params.user;
				},
				
				createMarkerFromPlace: function (place) {
					return new google.maps.Marker({
					    map: this.googleMap,
					    draggable: false,
					    position: new google.maps.LatLng(place.gpsLocation.north, place.gpsLocation.west),
					    icon: this.getMarkerIcon(place),
					    title: place.name,
					    url: place.url
					});
				},
				
				getMarkerIcon: function (place) {
					return place.iconUrl;
				},
				
				fetchPlaces: function(params, success) {
					httpService.sendGetJson(window.app.contextPath + 'tour/public/places/listjson', params, function(data) {
						console.log('fetched number of places: ' + (data.places ? data.places.length : 0));
						console.log('fetched static map link: ' + data.staticMapLink);
						success(data);
					});
				}
					
			}
			
			return new PlacesMap(mapElement, mapOptions);
		
		}
	
	};

});

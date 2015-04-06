define(['async!https://maps.googleapis.com/maps/api/js?key=AIzaSyAbbZrV_w_DmKzCVuFSxgkBs4pvi1gk1VA&amp;sensor=true&amp;language=cs', 'http-service', 'jquery'], 
		function(googleMap, httpService, $) {

	return {
		createMap: function(mapElement, mapOptions, config) {	
			
			var PlacesMap = function(mapElement, mapOptions, config) {
				
				this.myPlaces = false;
				this.config = config;
				this.places = {};
			    this.googleMap = {};
			    this.largeMarkers = false;
			    this.markers = [];
			    
			}
			
			PlacesMap.prototype = {
			
				init: function(params) {

					this.googleMap = new google.maps.Map(mapElement, mapOptions);
					
					var instance = this;
					this.fetchPlaces(params, function(data) {
						instance.places = data;
						instance.setMapPosition(params); // must be called before addPlacesToMap, becase mapPoistion define largeMarkers
						instance.addPlacesToMap(data);
					});
				},
				
			    updateMap: function(params) {
			    	
			    	var instance = this;
			    	this.fetchPlaces(params, function(data) {
			    		instance.removePlaces();
			    		instance.places = data;
						if (instance.places) {
							return instance.addPlacesToMap(data);
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
					var regionZoom = params.region_zoom;
					if (north && west) {
						this.googleMap.setCenter(new google.maps.LatLng(north, west));
						if (regionZoom) {
							this.googleMap.setZoom(parseInt(regionZoom));
						} else {
							this.googleMap.setZoom(config.defaultRegionZoom);
						}
						this.largeMarkers = true;
					} else {
						this.googleMap.setCenter(config.defaultCenter);
						this.googleMap.setZoom(config.defaultZoom);
						this.largeMarkers = false;
					}
				},
			    
				addPlacesToMap: function(places, placeFilter) {
					
					this.markers = [];
					
					for (var i = 0; i < places.length; i++) {
						var place = places[i];
						var highlight = place.id === config.highlightPlaceId;    					
						
						if (place.gpsLocation) {
							
							if (!placeFilter || placeFilter(place)) {
								var marker;
								if (highlight) {
									var infowindow = new google.maps.InfoWindow({
										content: '<h2 class="title">' + place.name + '</h2>'
									});
									marker = this.createMarkerFromPlace(place, true, config); 
									infowindow.open(googleMap, marker);
								} else {
									marker = this.createMarkerFromPlace(place, this.largeMarkers, config);
								}
								this.markers.push(marker);
								
								marker.addListener('click', function(marker) {
									window.location.assign(this.url);    						
								});
							}
						};
					}
				},
				
				createMarkerFromPlace: function (place, largeMarkers, config) {
					return new google.maps.Marker({
					    map: this.googleMap,
					    draggable: false,
					    position: new google.maps.LatLng(place.gpsLocation.north, place.gpsLocation.west),
					    icon: this.getMarkerIcon(place, largeMarkers),
					    title: place.name,
					    url: config.placeUrl + "/" + place.id
					});
				},
				
				getMarkerIcon: function (place, largeMarker) {
					var color = place.placeTypeColor;
					var fileName;
					if (largeMarker) {
						fileName = color + (place.beenThere ? '_my_large' : '') + '.png'
					} else {
						fileName = color + (place.beenThere ? '_my' : '') + '.png'
					}
					return (window.app.contextPath === '/' ?  '' : window.app.contextPath) + '/resources/img/places/' + fileName;
				},
				
				fetchPlaces: function(params, success) {
					httpService.sendGetJson(window.app.contextPath + 'tour/public/places', params, function(data) {
						console.log('fetched number of places: ' + data);
						success(data);
					});
				}
					
			}
			
			return new PlacesMap(mapElement, mapOptions, config);
		
		}
	
	};

});

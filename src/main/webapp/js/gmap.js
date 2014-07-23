function init(canvasId, zoom, mapListeners, initializer) {

	function initialize() {
		
		var myLatlng = new google.maps.LatLng(49.8, 15.5);
		
		var mapOptions = {
			zoom: zoom,
			center: myLatlng
		};

		var map = new google.maps.Map(document.getElementById(canvasId), mapOptions);	
		
		for (var i = 0; i < mapListeners.length; i++) {
			mapListeners[i](map);
		} 
		
	}

	initializer(initialize);
}
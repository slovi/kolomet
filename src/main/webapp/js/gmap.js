define(['jquery', 'async!https://maps.googleapis.com/maps/api/js?key=AIzaSyAbbZrV_w_DmKzCVuFSxgkBs4pvi1gk1VA&sensor=true&language=cs'], function($) {
	
	return {
		init: function(canvasId) {

			function initialize() {
				var myLatlng = new google.maps.LatLng(49.8, 15.5);
				var mapOptions = {
						zoom: 7,
						center: myLatlng
				};
				new google.maps.Map(document.getElementById(canvasId), mapOptions);
			}

			google.maps.event.addDomListener(window, 'load', initialize);
		}
	};
	
});
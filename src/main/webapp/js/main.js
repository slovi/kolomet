
console.log('starting require config');

require.config({
	
	paths: {
		jquery: 'lib/jquery-1.11.0.min',
		jquery_ui: 'lib/jquery-ui-1.10.4.custom.min',
		jquery_lean: 'lib/jquery.leanModal.min'		
	},
	shim: {
		'jquery_ui': {
			deps: ['jquery']
		},
		'jquery_lean': {
			deps: ['jquery']
		}
	}	
	
});

require(['login', 'side_menu', 'slider'], function(login, sideMenu, slider) {
	login.prepare();
	sideMenu.prepare();
	slider.slider('price_slider', 0, 100000, 0, 100000, 500);
	slider.slider('discount_slider', 0, 10000, 0, 10000, 500);
	slider.slider('weight_slider', 0, 50, 0, 50, 1);
});
	

console.log('finishing require config');
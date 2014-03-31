require.config({
	
	paths: {
		jquery: 'lib/jquery-1.11.0.min',
		jquery_lean: 'lib/jquery.leanModal.min',
	},
	shim: {
		'side_menu': {
			deps: ['jquery']
		},
		'jquery_lean': {
			deps: ['jquery']
		},
		'login': {
			deps: ['jquery', 'jquery_lean']
		}
	}	
	
});

require(['jquery', 'jquery_lean', 'side_menu', 'login'], function() {});
require.config({
	
	paths: {
		jquery: 'lib/jquery-1.11.0.min'
	},
	shim: {
		'side_menu': {
			deps: ['jquery']
		}
	}	
	
});

require(['jquery', 'side_menu'], function() {});
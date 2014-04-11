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
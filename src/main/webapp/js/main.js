
require.config({
	
	paths: {
		jquery: 'lib/jquery-1.11.0.min',
		jquery_ui: 'lib/jquery-ui-1.10.4.custom.min',
		jquery_lean: 'lib/jquery.leanModal.min',
		jquery_number: 'lib/jquery.numberformatter-1.2.4.min',
		jshashtable: 'lib/jshashtable-3.0',
		async: 'lib/async',
	},
	shim: {
		'jquery_ui': {
			deps: ['jquery']
		},
		'jquery_lean': {
			deps: ['jquery']
		},
		'jquery_number': {
			deps: ['jquery', 'jshashtable']
		},
		'main':{
            deps: ['jquery']   
        }
	}	
	
});
	

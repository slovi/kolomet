require.config({
	
	paths: {
		'jquery': 'lib/jquery-1.11.0.min',
		'jquery.ui': 'lib/jquery-ui.min',
		'jquery.iframe-transport': 'lib/jquery.iframe-transport',
		'jquery.fileupload': 'lib/jquery.fileupload',
		'jquery.fileupload-audio': 'lib/jquery.fileupload-audio',
		'jquery.fileupload-image': 'lib/jquery.fileupload-image',
		'jquery.fileupload-jquery-ui': 'lib/jquery.fileupload-jquery-ui',
		'jquery.fileupload-process': 'lib/jquery.fileupload-process',
		'jquery.fileupload-ui': 'lib/jquery.fileupload-ui',
		'jquery.fileupload-validate': 'lib/jquery.fileupload-validate',
		'jquery.fileupload-video': 'lib/jquery.fileupload-video',
		'load-image-meta': 'lib/load-image-meta',
		'load-image-exif': 'lib/load-image-exif',
		'load-image': 'lib/load-image',
		'load-image-ios': 'lib/load-image-ios',
		'canvas-to-blob': 'lib/canvas-to-blob.min',
		'tmpl': 'lib/tmpl.min',
		'jquery.lean': 'lib/jquery.leanModal.min',
		'jquery.number': 'lib/jquery.numberformatter-1.2.4.min',
		'bootstrap': 'lib/bootstrap.min',
		jquery_maphilight: 'lib/jquery.maphilight',
		jshashtable: 'lib/jshashtable-3.0'
	},
	shim: {
		'bootstrap': {
			deps: ['jquery']
		},
		'jquery.ui': {
			deps: ['jquery']
		},
		'jquery.iframe-transport': {
			deps: ['jquery']
		},
		'jquery.lean': {
			deps: ['jquery']
		},
		'jquery.number': {
			deps: ['jquery', 'jshashtable']
		},
		'jquery_maphilight': {
			deps: ['jquery']
		}
	},
	map: {
	    '*': {
	      'jquery.ui.widget': 'jquery.ui'
	    }
	}
	
});

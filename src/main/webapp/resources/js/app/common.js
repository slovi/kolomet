require.config({
	
	urlArgs: 'v=${project.version}',
	paths: {
		
		// libs
		'async': '../../lib/async',
		'canvas-to-blob': '../../lib/canvas-to-blob.min',
		'jquery': '../../lib/jquery-1.11.0.min',
		'jquery.block-ui': '../../lib/jquery.blockUI',
		'jquery.iframe-transport': '../../lib/jquery.iframe-transport',
		'jquery.fileupload': '../../lib/jquery.fileupload',
		'jquery.fileupload-audio': '../../lib/jquery.fileupload-audio',
		'jquery.fileupload-image': '../../lib/jquery.fileupload-image',
		'jquery.fileupload-jquery-ui': '../../lib/jquery.fileupload-jquery-ui',
		'jquery.fileupload-process': '../../lib/jquery.fileupload-process',
		'jquery.fileupload-ui': '../../lib/jquery.fileupload-ui',
		'jquery.fileupload-validate': '../../lib/jquery.fileupload-validate',
		'jquery.fileupload-video': '../../lib/jquery.fileupload-video',
		'jquery.lean': '../../lib/jquery.leanModal.min',
		'jquery.number': '../../lib/jquery.numberformatter-1.2.4.min',
		'jquery.ui': '../../lib/jquery-ui.min',
		'jquery.validation': '../../lib/jquery.validate.min',
		'jshashtable': '../../lib/jshashtable-3.0',
		'lightbox': '../../lib/lightbox.min',
		'load-image-meta': '../../lib/load-image-meta',
		'load-image-exif': '../../lib/load-image-exif',
		'load-image': '../../lib/load-image',
		'load-image-ios': '../../lib/load-image-ios',
		'mustache': '../../lib/mustache',
		'tmpl': '../../lib/tmpl.min',

		// modules
		
		'ajax-link': '../../modules/ajax-link',
		'ajax-submit': '../../modules/ajax-submit',
		'config-service': '../../modules/config-service',
		'form': '../../modules/form', 
		'http-service': '../../modules/http-service',
		'input-file': '../../modules/input-file/input-file',
		'images': '../../modules/images',
		'loader': '../../modules/loader',
		'login': '../../modules/login', 
		'side_menu': '../../modules/side_menu',
		'slider': '../../modules/slider',
		'template-service': '../../modules/template-service'
		
	},
	shim: {
		'jquery.te': {
			deps: ['jquery.snippet', 'jquery']
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
		},
		'jquery.steps': {
			deps: ['jquery']
		},
		'jquery.validation': {
			deps: ['jquery']
		},
		'lightbox': {
			deps: ['jquery']
		},
		'mustache': {
			exports: 'Mustache'
		}
	},
	map: {
	    '*': {
	      'jquery.ui.widget': 'jquery.ui'
	    }
	}
	
});

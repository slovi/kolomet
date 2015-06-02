
String.prototype.removeDiacritics = function() {
	
	sdiak='áäčďéěíĺľňóôőöŕšťúůűüýřžÁÄČĎÉĚÍĹĽŇÓÔŐÖŔŠŤÚŮŰÜÝŘŽ';
	bdiak='aacdeeillnoooorstuuuuyrzAACDEEILLNOOOORSTUUUUYRZ';
	
	var tx = ''; 
	var txt = this;
	
	for(p=0;p<txt.length;p++) { 
		if (sdiak.indexOf(txt.charAt(p)) != -1) { 
			tx += bdiak.charAt(sdiak.indexOf(txt.charAt(p)));
		} else {
			tx += txt.charAt(p);
		}
	}
	return tx;
}

function concatParams(array1, array2) {
	var keys = {};
	var newArray = [];
	$.each(array1, function(i, field) {
		if (keys[field.name] != 'exist') {
			newArray.push(field);
		}
		keys[field.name] = 'exist';
	});
	$.each(array2, function(i, field) {
		if (keys[field.name] != 'exist') {
			newArray.push(field);
		}
		keys[field.name] = 'exist';
	});
	return newArray;
}

function objectToObjectArray(object) {
	var objectArray = [];
	for (key in object) {
		objectArray.push({name: key, value: object[key]});
	} 
	return objectArray;
}

function encodeArrayToQueryString(params) {
	var urlString = [];
	for (var i = 0; i < params.length; i++) {
		if (params[i].name != 'ajaxSource') {
			urlString.push(params[i].name + '=' + params[i].value);
		}
	}
	return urlString.join('&');
}

require.config({
	
	urlArgs: 'v=${project.version}',
	paths: {
		
		// libs
		'async': '../../lib/async',
		'bootstrap': '../../lib/bootstrap.min',
		'canvas-to-blob': '../../lib/canvas-to-blob.min',
		'docs': '../../lib/docs.min',
		'facebook': '../../lib/facebook-all',
		'ie-viewport-bug-workaround': '../../lib/ie10-viewport-bug-workaround',
		'jssor-slider': '../../lib/jssor.slider.mini',
		'jquery': '../../lib/jquery-1.11.0.min',
		'jquery.block-ui': '../../lib/jquery.blockUI',
		'jquery.iframe-transport': '../../lib/jquery.iframe-transport',
		'jquery.fileupload': '../../lib/jquery.fileupload',
		'jquery.history': '../../lib/jquery.history',
		'jquery.iframe-transport': '../../lib/jquery.iframe-transport',
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
		'fb': '../../modules/fb',
		'form': '../../modules/form', 
		'http-service': '../../modules/http-service',
		'input-file': '../../modules/input-file/input-file',
		'images': '../../modules/images',
		'loader': '../../modules/loader',
		'login': '../../modules/login', 
		'map-places': '../../modules/map-places',
		'place-banners': '../../modules/place-banners',
		'partner-links': '../../modules/partner-links',
		'side_menu': '../../modules/side_menu',
		'slider': '../../modules/slider',
		'template-service': '../../modules/template-service'
		
	},
	shim: {
		'bootstrap': {
			deps: ['jquery']
		},
		'docs': {
			deps: ['bootstrap']
		},
		'jquery.te': {
			deps: ['jquery.snippet', 'jquery']
		},
		'jquery.ui': {
			deps: ['jquery']
		},
		'jquery.iframe-transport': {
			deps: ['jquery']
		},
		'jquery.history': {
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
		},
		'facebook': {
			exports: 'FB'
		}
	},
	map: {
	    '*': {
	      'jquery.ui.widget': 'jquery.ui'
	    }
	}
	
});

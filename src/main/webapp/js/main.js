require.config({
	
	paths: {
		jquery: 'lib/jquery-1.11.0.min',
		jquery_lean: 'lib/jquery.leanModal.min',
		jquery_fileupload: 'lib/jquery.fileupload',
		jquery_fileupload_audio: 'lib/jquery.fileupload-audio',
		jquery_fileupload_image: 'lib/jquery.fileupload-image',
		jquery_fileupload_process: 'lib/jquery.fileupload-process',
		jquery_fileupload_ui: 'lib/jquery.fileupload-ui',
		jquery_fileupload_validate: 'lib/jquery.fileupload-validate',
		jquery_fileupload_video: 'lib/jquery.fileupload-video',
		
	},
	shim: {
		'jquery_lean': {
			deps: ['jquery']
		}
	}	
	
});
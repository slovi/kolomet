define([ 'jquery' , 'jquery.fileupload', 'jquery.fileupload-image', 'load-image' ], function($, fileUpload, fileUploadImage, loadImage) {

	return {

		files : function(id, url, maxFiles, noImgUrl, options) {		
			
			var previews = $('.image-preview');
			if (previews.length == 0) {
				loadDetailImage(noImgUrl, options);
			}

			$('#' + id).fileupload({
				
				url: url,
				dataType : 'json',
				autoUpload: true,
				acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
				disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator.userAgent),
				previewMaxWidth: 100,
				previewMaxHegith: 100,
				previewCrop: true,
				singleFileUploads: false
				
			}).on('fileuploadadd', function(e, data) {	
				
				data.context = $('#files');
				
				$.each(data.files, function(index, file) {
					
					var button = $('<button />').addClass('cancel').data(data).append($('<span />').text('Odebrat'));
					
					button.click(function(e) {
						e.preventDefault();
						var data = $(this).data();
						$(this).closest('div.image-preview').remove();
						data.abort();
						if (data.context.children().length < (maxFiles + 1)) {
							$("div.files_add").show();
						}
						var input = $('#files_container input.files-multi-filename').get(data.index);
						$(input).val('');
					});
					
					var node = $('<div />').addClass('image-preview').prepend($('<span />').addClass('filename').text(file.name).append(button));
					
					if (data.context.children().length > maxFiles - 1) {
						$("div.files_add").hide();
					}												
					
					if (data.context.children().length == 1) {
						node.prependTo(data.context);
					} else {
						node.insertBefore(data.context.children()[data.context.children().length - 1]);
					}
					var input = $('#files_container input.files-multi-filename').get(data.context.children().length - 2);
					$(input).val(file.name + '__;__' + file.type);
					data.formData = {'filename': file.name};
					
				});								
				
				data.submit();
				
			}).on('fileuploadprocessalways', function(e, data) {
				
				var index = data.index;
				var childrenIndex = data.context.children().length > 1 ? data.context.children().length - 2 : data.index;
				var file = data.files[index];
				var node = $(data.context.children()[childrenIndex]);

				if (file.preview) {
					node.prepend('<br />').prepend(file.preview);
				}
			}).on('fileuploadchange', function(e, data) {
				
				if (data.files.length == 0) {
					loadDetailImage(noImgUrl, options);
				} else {
					loadDetailImage(data.files[0], options);
				}
			});

		}
	};
	
	function loadDetailImage(image, options) {
		loadImage(
			image,
	        function (img) {
				var detailElement = $('div#detail_image');
				detailElement.empty();
				detailElement.append(img);
	        },
	        options // Options		
		);
	};

});

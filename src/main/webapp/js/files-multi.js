define([ 'jquery' , 'jquery.fileupload', 'jquery.fileupload-image', 'load-image' ], function($, fileUpload, fileUploadImage, loadImage) {

	return {

		files : function(id, url, maxFiles, baseImgUrl, noImgUrl, options) {		
			
			var previews = $('.image-preview');
			if (previews.length == 0) {
				loadDetailImage(noImgUrl, options);
			}

			$('#' + id).fileupload({
				
				url: url,
				dataType : 'json',
				autoUpload: true,
				acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
				disableImageResize: true,
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
					
					var node = $('<div />').addClass('image-preview').prepend(
							$('<span />').addClass('filename').text(file.name)
							.append($('<img />').addClass('preloaded').attr('width', '100').attr('height', '100').attr('src', baseImgUrl + '/' + file.name))
							.append(button));
					
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
					
				});
				
				data.submit();
				
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

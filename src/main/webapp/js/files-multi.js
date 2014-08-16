define([ 'jquery' , 'jquery.fileupload', 'jquery.fileupload-image', 'images'], function($, fileUpload, fileUploadImage, images) {

	return {

		files : function(id, url, maxFiles, baseImgUrl, noImgUrl, loaderUrl, errorImgUrl, options) {		
			
			var previews = $('.image-preview');
			if (previews.length == 0) {
				loadEmptyDetailImage(noImgUrl);
			}

			$('#' + id).fileupload({
				
				enctype: 'multipart/form-data',
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
							.append(
									$('<div />').addClass('thumb_large').prepend(
											$('<img />').addClass('wait_for_load').attr('src', baseImgUrl + '/' + file.name + '?format=_thumb')
									)
							)
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
					
					images.waitForLoad(loaderUrl, errorImgUrl, 6, 2000);
					
				});
				
				data.submit();
				
			}).on('fileuploadchange', function(e, data) {
				
				if (data.files.length == 0) {
					loadEmptyDetailImage(noImgUrl);
				} else {
					loadDetailImage(data.files[0], baseImgUrl, loaderUrl, errorImgUrl, images);
				}
			});

		}
	};
	
	function loadEmptyDetailImage(noImgUrl) {
		var imgElement = $('div#detail_image img');
		imgElement.attr('src', noImgUrl);
	}
	
	function loadDetailImage(image, baseImgUrl, loaderUrl, errorImgUrl, images) {
		var imgElement = $('div#detail_image img');
		imgElement.attr('src', baseImgUrl + '/' + image.name + '?format=_orig');
		imgElement.addClass('wait_for_load');
		images.waitForImagesLoad(imgElement, loaderUrl, errorImgUrl, 6, 2000);
	};

});

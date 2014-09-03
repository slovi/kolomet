define([ 'jquery' , 'jquery.fileupload', 'jquery.fileupload-image'], function($, fileUpload, fileUploadImage) {

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
				
				data.context = $('div#files');				
				var thumbnails = $('div#thumbnails');
				
				if (!data.thumbnailNodes) {
					data.thumbnailNodes = []; 
				}
				if (!data.nodex) {
					data.nodes = [];
				}
				
				$.each(data.files, function(index, file) {
					
					var button = createCancelButton(data, thumbnails, maxFiles, baseImgUrl, loaderUrl, errorImgUrl, noImgUrl);
					
					var thumbnailNode = createProgressThumbnailNode(data.files[0], 0);
					var node = createProgressNode(data.files[index], 0, button);
					
					data.thumbnailNodes.push(thumbnailNode);
					data.nodes.push(node);
					
					if (data.context.children().length > maxFiles - 1) {
						$("div.files_add").hide();
					}
					
					if (data.context.children().length == 1) {
						node.prependTo(data.context);						
					} else {
						node.insertBefore(data.context.children()[data.context.children().length - 1]);
					}
					thumbnailNode.appendTo(thumbnails);
					
					var input = $('div.files_container input.files-multi-filename').get(data.context.children().length - 2);
					$(input).val(getInputValue(file));										
					
					console.log('Try to send data for file: ' + data.files[0].name);
					data.submit();
					
				});
				
			}).on('fileuploadfail', function(e, data) {								
				
				var thumbnails = $('div#thumbnails');
				
				$.each(data.files, function(index, file) {
					
					var button = createCancelButton(data, thumbnails, maxFiles, baseImgUrl, loaderUrl, errorImgUrl, noImgUrl);
					
					var thumbnailNode = data.thumbnailNodes[index];
					var newThumbnailNode = createErrorThumbnailNode(data.files[index], errorImgUrl);
					data.thumbnailNodes[index] = newThumbnailNode;
					thumbnailNode.replaceWith(newThumbnailNode);
					
					var node = data.nodes[index];
					var newNode = createErrorNode(data.files[index], button, errorImgUrl);
					data.nodes[index] = newNode;
					node.replaceWith(newNode);
					
				});	
				
				console.log('Cannot upload file: ' + data.files[0].name + ', problem: ' + data.errorThrown);
				alert('Cannot upload file: ' + data.files[0].name + ', problem: ' + data.errorThrown);
				
			}).on('fileuploaddone', function(e, data) {
				
				
				var thumbnails = $('div#thumbnails');
				
				$.each(data.files, function(index, file) {
					
					var button = createCancelButton(data, thumbnails, maxFiles, baseImgUrl, loaderUrl, errorImgUrl, noImgUrl);
					
					var thumbnailNode = data.thumbnailNodes[index];
					var newThumbnailNode = createThumbnailNode(data.files[index], baseImgUrl, loaderUrl, errorImgUrl);
					data.thumbnailNodes[index] = newThumbnailNode;
					thumbnailNode.replaceWith(newThumbnailNode);
					
					var node = data.nodes[index];
					var newNode = createNode(data.files[index], button, baseImgUrl);
					data.nodes[index] = newNode;
					node.replaceWith(newNode);
				
					console.log('Successfuly uploaded file: ' + data.files[index].name);
				});	

				loadDetailImage(data.files[data.files.length - 1], baseImgUrl, loaderUrl, errorImgUrl);
				
				
			}).on('fileuploadprogress', function(e, data) {
				
				var progress = parseInt(data.loaded / data.total * 100, 10);
				console.log(progress);
				
				var button = createCancelButton(data, thumbnails);
				
				$.each(data.files, function(index, file) {
					
					var progress = parseInt(data.loaded / data.total * 100, 10);
					
					var progressText;
					if (progress < 100) {
						progressText = 'Uploaduji: ' + progress + '%';
					} else {
						progressText = 'Optimalizuji...';
					}
					
					var thumbnailNode = data.thumbnailNodes[index];
					var newThumbnailNode = createProgressThumbnailNode(data.files[index], progressText, loaderUrl);
					data.thumbnailNodes[index] = newThumbnailNode;
					thumbnailNode.replaceWith(newThumbnailNode);
					
					var node = data.nodes[index];
					
					var newNode = createProgressNode(data.files[index], progressText, loaderUrl, button);
					data.nodes[index] = newNode;
					node.replaceWith(newNode);
					
				});
				
			});

		}
	};
	
	function getFiles(context) {
		var files = [];
		$('button.cancel', context).each(function(index, element) {
			files[index] = $(element).data().files[0];
		});
		return files;
	}
	
	function getInputValue(file) {
		return file.name + '__;__' + file.type;
	}
	
	function createNode(file, button, baseImgUrl) {
		return $('<div />').addClass('image_preview').prepend($('<span />').addClass('filename').text(file.name))
					.append(
						$('<div />').addClass('thumbnail_upload').prepend(
							$('<img />').attr('src', baseImgUrl + '/' + file.name + '?format=_thumb'))).append(button);
	}
	
	function createErrorNode(file, button, errorImgUrl) {
		return $('<div />').addClass('image_preview').prepend($('<span />').addClass('filename').text(file.name))
					.append(
						$('<div />').addClass('thumbnail_upload').prepend(
							$('<img />').attr('src', errorImgUrl))).append(button);
	}
	
	function createProgressNode(file, progressText, loaderUrl, button) {
		return $('<div />').addClass('image_preview').prepend($('<span />').addClass('filename').text(file.name))
		.append(
			$('<div />').addClass('thumbnail_upload')
				.append($('<span />')
						.append($('<br/>'))
						.append($('<img />').attr('src', loaderUrl))
						.append($('<br/>'))
						.append($('<span />').html(progressText)))).append(button);
	}
	
	function createThumbnailNode(file, baseImgUrl, loaderUrl, errorImgUrl) {
		return $('<div />').addClass('image_preview').prepend(
					$('<span />').addClass('filename').text(file.name)
				).append(
					$('<div />').addClass('thumbnail_upload').prepend(
						$('<a />').attr('href', '#').click(function(event) {
							event.preventDefault();
							loadDetailImage({name: file.name}, baseImgUrl, loaderUrl, errorImgUrl);
						}).prepend(
							$('<img />').attr('src', baseImgUrl + '/' + file.name + '?format=_thumb'))));
	};
	
	function createErrorThumbnailNode(file, errorImgUrl) {
		return $('<div />').addClass('image_preview').prepend(
					$('<span />').addClass('filename').text(file.name)
				).append(
					$('<div />').addClass('thumbnail_upload').prepend(
							$('<img />').attr('src', errorImgUrl)));
	};
	
	function createProgressThumbnailNode(file, progressText, loaderUrl) {
		return $('<div />').addClass('image_preview').prepend(
					$('<span />').addClass('filename').text(file.name)
				).append(
					$('<div />').addClass('thumbnail_upload')
						.append($('<span />')
								.append($('<br/>'))
								.append($('<img />').attr('src', loaderUrl))
								.append($('<br/>'))
								.append($('<span />').html(progressText))));
					
	};
	
	function createCancelButton(data, thumbnails, maxFiles, baseImgUrl, loaderUrl, errorImgUrl, noImgUrl) {
		
		var button = $('<button />').addClass('cancel').data(data).append($('<span />').text('Odebrat'));
		
		button.click(function(e) {
			
			e.preventDefault();
			var data = $(this).data();
			data.abort();
			
			$(this).closest('div.image_preview').remove();		

			if (data.context.children().length < (maxFiles + 1)) {
				$("div.files_add").show();
			}

			var inputs = $('div.files_container input.files-multi-filename'); 
			var files = getFiles(data.context);
			
			for (var i = 0; i < inputs.length; i++) {
				if (i < files.length) {
					$(inputs[i]).val(getInputValue(files[i]));
				} else {
					$(inputs[i]).val('');
				}
			}
			
			thumbnails.empty();
									
			for (var i = 0; i < files.length; i++) {
				thumbnails.append(createThumbnailNode(files[i], baseImgUrl, loaderUrl, errorImgUrl));
			}
			
			if (data.context.children().length == 1) {
				loadEmptyDetailImage(noImgUrl);
			} else {
				loadDetailImage(files[files.length - 1], baseImgUrl, loaderUrl, errorImgUrl);
			}
			
		});
		
		return button;
	}
	
	function loadEmptyDetailImage(noImgUrl) {
 		var imgElement = $('div#detail_image img');
		imgElement.attr('src', noImgUrl);
	}
	
	function loadDetailImage(image, baseImgUrl, loaderUrl, errorImgUrl) {
		var imgElement = $('div#detail_image img');
		imgElement.attr('src', baseImgUrl + '/' + image.name + '?format=_orig');
	};

});

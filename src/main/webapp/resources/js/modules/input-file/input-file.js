define([ 'jquery' , 'jquery.fileupload', 'jquery.iframe-transport', 'http-service', 'config-service', 'template-service'], 
		function($, fileUpload, iframeTransport, httpService, configService, templateService) {

	return {
		
		defaultSize: 4,
		
		decorateId: function(id, listeners) {
			
			var configuration = configService.readConfig(id + '_container');
			configuration.listeners = listeners;
			
			var context = $('div#' + id + '_container > div.thumbnails_container');
						
			var files = {
					previouslyUploadedFiles: initFiles(configuration),
					uploadedFiles: new Array(),
					get: function(index) {
						if (index < this.previouslyUploadedFiles.length) {
							return this.previouslyUploadedFiles[index];
						} else {
							return this.uploadedFiles[index - this.previouslyUploadedFiles.length];
						}
					},
					addUploadedFile: function(file) {
						this.uploadedFiles.push(file);
					},
					isEmpty: function() {
						return this.getSize() == 0;
					},
					getLastFile: function() {
						var allFiles = this.getAllFiles(); 
						return allFiles[allFiles.length - 1];
					},
					getAllFiles: function() {
						return this.previouslyUploadedFiles.concat(this.uploadedFiles);
					},
					getSize: function() {
						return this.previouslyUploadedFiles.length + this.uploadedFiles.length;
					},
					getIndex: function(index) {
						return this.previouslyUploadedFiles.length + index;
					},
					markFileAsPreviouslyUploaded: function(index) {
						this.previouslyUploadedFiles.push(this.uploadedFiles[index]);
						this.uploadedFiles.splice(index, 1);
					},
					remove: function(index) {
						if (index < this.previouslyUploadedFiles.length) {
							this.previouslyUploadedFiles.splice(index, 1);
						} else {
							this.uploadedFiles.splice(index - this.previouslyUploadedFiles.length, 1);
						}
					},
					containsFileName: function (fileName) {
						var allFiles = this.getAllFiles();
						for (var i = 0; i < allFiles.length; i++) {
							if (allFiles[i].name == fileName) {
								return true;
							}
						}
						return false;
					}
			}
			
			if (files.previouslyUploadedFiles) {
				renderUploadedFiles(files, context, configuration);
				if (listeners.onFileInitialLoadFinish) {
					listeners.onFileInitialLoadFinish(files, configuration);
				}
			}
			
			$('#' + id).fileupload({
				enctype: 'multipart/form-data',
				url: configuration.get('uploadFileUrl'),
				dataType : 'json',
				autoUpload: false,
				acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
				disableImageResize: true,
				singleFileUploads: true
				
			}).on('fileuploadadd', function(e, data) {				
				
				$.each(data.files, function(index, file) {					
					
					if (files.containsFileName(file.name)) {
						alert('Soubor s nazvem: ' + file.name + ' jiz existuje mezi obrazky.');
						return;
					}
					files.addUploadedFile(convertUploadedFileFromInternalModel(file, configuration));
					renderUploadedFile(files, files.getIndex(index), context, 'templateThumbnailProgress', configuration);
					
					if (listeners.onFileUploadAdd) {
						listeners.onFileUploadAdd(files, files.getIndex(index), configuration);
					}
					
					hideUploadFileButtonIfPossible(files, configuration);
					console.log('Try to send data for file: ' + file.name);
					data.submit();
					
				});				
				
				if (listeners.onFileUploadAddFinish) {
					listeners.onFileUploadAddFinish(files, configuration);
				}
				
			}).on('fileuploadfail', function(e, data) {
				
				$.each(data.files, function(index, file) {
					
					renderUploadedFile(files, files.getIndex(index), context, 'templateThumbnailError', configuration, true);
					
					if (data.jqXHR.responseJSON) {
						console.log('Cannot upload file: ' + data.files[0].name + ', problem: ' + data.jqXHR.responseJSON.ajaxError.errorDescription);
						alert('Neni mozne nahrat soubor: ' + data.files[0].name + ', problem: ' + data.jqXHR.responseJSON.ajaxError.errorDescription);
					} else {
						if (data.errorThrown) {
							console.log('Cannot upload file: ' + data.errorThrown);
							alert('Neni mozne nahrat soubor: ' + data.errorThrown);
						} else {
							console.log('Cannot upload file: Nedostatecne pripojeni k internetu.');
							alert('Neni mozne nahrat soubor: Nedostatecne pripojeni k internetu.');
						}
					}

					removeFileItem(files, files.getIndex(index), context, configuration);
					
					if (listeners.onFileUploadFail) {
						listeners.onFileUploadFail(files, files.getIndex(index), configuration);
					}
				});
				
				if (listeners.onFileUploadFailFinish) {
					listeners.onFileUploadFailFinish(files, configuration);
				}
				
			}).on('fileuploaddone', function(e, data) {
				
				$.each(data.files, function(index, file) {
					
					renderUploadedFile(files, files.getIndex(index), context, 'templateThumbnail', configuration, true);
					console.log('Successfuly uploaded file: ' + data.files[index].name);
					files.markFileAsPreviouslyUploaded(index);
					
					if (listeners.onFileUploadDone) {
						listeners.onFileUploadDone(files, files.getIndex(index), configuration);
					}
				});
				
				if (listeners.onFileUploadDoneFinish) {
					listeners.onFileUploadDoneFinish(files, configuration);
				}
				
			}).on('fileuploadprogress', function(e, data) {
				
				$.each(data.files, function(index, file) {
					
					var progress = parseInt(data.loaded / data.total * 100, 10);
					
					var progressText;
					if (progress < 100) {
						progressText = 'Uploaduji: ' + progress + '%';
					} else {
						progressText = 'Optimalizuji...';
					}
					var actualIndex = files.getIndex(index);
					files.get(actualIndex).progress = progressText;
					renderUploadedFile(files, files.getIndex(index), context, 'templateThumbnailProgress', configuration, true);
					
					if (listeners.onFileUploadProgress) {
						listeners.onFileUploadProgress(files, files.getIndex(index), configuration);
					}
					
				});
				
				if (listeners.onFileUploadProgressFinish) {
					listeners.onFileUploadProgressFinish(files, configuration);
				}
				
			});

		}
	};
	
	function replaceAndRerenderUploadedFiles(files, context, configuration) {
		
		$('div.file_item', context).remove();
		renderUploadedFiles(files, context, configuration);
	}
	
	function renderUploadedFiles(files, context, configuration) {
		
		for (var i = 0; i < files.getSize(); i++) {
			renderUploadedFile(files, i, context, 'templateThumbnail', configuration);
		}
		hideUploadFileButtonIfPossible(files, configuration);
	}
	
	function renderUploadedFile(files, index, context, templateName, configuration, replace) {
		
		var html = $(templateService.loadHtml(configuration.get(templateName), files.get(index)));
		
		if (replace) {
			context.children().eq(index).replaceWith(html);
		} else {
			html.insertBefore(context.children().last());
		}
		$('button.cancel', html).click(function(e) {					
			
			e.preventDefault();
			
			if (confirm('Opravdu smazat soubor ' + files.get(index).name + '?')) {
				fireDeleteRequest(files.get(index), function(data) {
					removeFileItem(files, index, context, configuration);
					if (configuration.listeners.onFileDeleteFinish) {
						configuration.listeners.onFileDeleteFinish(files, index, configuration);
					}
				});
			}
		});
	}
	
	function removeFileItem(files, index, context, configuration) {
		files.remove(index);			
		replaceAndRerenderUploadedFiles(files, context, configuration);
		showUploadFileButtonIfPossible(files, configuration);
	}
	
	function hideUploadFileButtonIfPossible(files, configuration) {
		if (files.getSize() >= configuration.get('size', this.defaultSize)) {
			$("div.files_add").hide();
		}
	}
	
	function showUploadFileButtonIfPossible(files, configuration) {
		if (files.getSize() < configuration.get('size', this.defaultSize)) {
			$("div.files_add").show();
		}
	}
	
	function fireDeleteRequest(uploadedFile, success) {
		httpService.send(uploadedFile.fileDeleteUrl, 'DELETE', {'fileName': uploadedFile.name}, function(data) {
			success(data);
		});
	}
	
	function getFiles(context) {
		var files = [];
		$('button.cancel', context).each(function(index, element) {
			files[index] = $(element).data().files[0];
		});
		return files;
	}
	
	// acutally uploaded files - internal model is model of jquery input-file.js
	function convertUploadedFileFromInternalModel(uploadedFile, configuration) {
		
		var fileUrl = configuration.get('fileTempBaseUrl') + '/' + uploadedFile.name;
		var fileDeleteUrl = configuration.get('fileTempBaseDeleteUrl') + '/' + uploadedFile.name;
		
		return {
			name: uploadedFile.name, 
			contentType: uploadedFile.type,
			fileThumbUrl: fileUrl + '?format=_thumb',
			fileDetailUrl: fileUrl + '?format=_detail&forceSendError=true',
			fileOrigUrl: fileUrl + '?format=_orig',
			fileOverUrl: fileUrl + '?format=_over',
			fileDeleteUrl: fileDeleteUrl,
			fileLoaderUrl: configuration.get('fileLoaderUrl'),
			fileErrorUrl: configuration.get('fileErrorUrl'),
			progress: '0%', 
			isTemp: function() {return true},
			nameAndContentType: function() {return this.name + '__;__' + this.contentType}
		};
	}
	
	// fileInfo, or Photo
	function convertUploadedFileFromExistingFile(index, uploadedFile, configuration) {
		
		var id = uploadedFile.id;
		var contentType = uploadedFile.contentType;
		var fileName = uploadedFile.fileName;
		var fileUrl = !id ? configuration.get('fileTempBaseUrl') + '/' + fileName : configuration.get('fileBaseUrl') + '/' + fileName;
		var fileDeleteUrl = !id ? configuration.get('fileTempBaseDeleteUrl') + '/' + fileName : configuration.get('fileBaseDeleteUrl') + '/' + id;
		
		return {
			id: uploadedFile.id,
			name: fileName, 
			contentType: contentType, 
			fileThumbUrl: fileUrl + '?format=_thumb',
			fileDetailUrl: fileUrl + '?format=_detail&forceSendError=true',
			fileOrigUrl: fileUrl + '?format=_orig',
			fileOverUrl: fileUrl + '?format=_over',
			fileDeleteUrl: fileDeleteUrl,
			isTemp: function() {return !this.id},
			nameAndContentType: function() {return this.name + '__;__' + this.contentType + '__;__' + this.id}
		};
	}
	
	function initFiles(configuration) {
		var previouslyUploadedFiles = configuration.getEvalAsArrayAndConvert('uploadedFiles', convertUploadedFileFromExistingFile);
		var previouslyAddedFiles =  configuration.getEvalAsArrayAndConvert('addedFiles', convertUploadedFileFromExistingFile);
		return previouslyUploadedFiles.concat(previouslyAddedFiles);
	}
	
	function getInputValue(file) {
		return file.name + '__;__' + file.type;
	}

});

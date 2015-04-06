define(['jquery', 'loader'], function($, loader) {
	
	return {
		
		sendAjax: function(config) {
			
			var data = this.serializeObjectToUrl(config.data);
			
			$.ajax({
		        url: config.url,
		        type: config.method,
		        data: data,
		        dataType: config.dataType,
		        beforeSend: function(xhr) {
		        	
		        	loader.show();
		        	
		        },
		        success: function(data) {		    
					
					loader.hide();
					config.success(data);
		        },
		        error: function(xhr, status, errorThrown) {
		        	
		        	loader.hide();
		        	if (xhr.statusText) {
		        		alert('Error: ' + xhr.statusText);
		        	} else if (xhr.responseJSON) {
		        		alert('Error: ' + xhr.responseJSON.ajaxError.errorDescription);
		        	} else {
		        		alert('Error: ' + errorThrown);
		        	}
		        },
		        complete: function(xhr) {
		        	
		        	// complete request
		        }
			});
			
		},
		
		sendGetJson: function(url, data, success) {
			
			var config = {
					url: url,
					method: 'GET',
					data: data,
					dataType: 'json',
					success: success
			};
			
			this.sendAjax(config);
			
		},
		
		send: function(url, method, data, success) {
			
			var config = {
					url: url,
					method: method,
					data: data,
					success: success
			};
			
			this.sendAjax(config)
		},
		
		sendAndRerender: function(url, method, params, success) {
			
			var config = {
					url: url,
					method: method,
					data: params,
					dataType: 'html',
					success: function(data) {
						
						var nodes = $.parseHTML(data);
						
			        	var offset = 0;
			        	if (params.fragments) {
			        		var fragments = params.fragments.split(',');
							for (var i = 0; i < fragments.length; i++) {
								var fragment = $('#' + $.trim(fragments[i])); 
								if (params.append) {
									fragment.append(nodes[i]);
								} else {
									fragment.empty();
									fragment.html(nodes[i]);
								}
								offset++;
							}
			        	}
			        	
			        	success(data);
			        	
					}
			}
			
			this.sendAjax(config);
			
		},
		
		serializeObjectToUrl: function(object, options) {
			
			var excludes = options;
			if (excludes) {
				for (var i = 0; i < excludes.length; i++) {
					delete object[excludes[i]];
				}
			}
			return $.param(object, true);
		},
		
		deserializeObjectFromUrl: function(urlToDeserialize, options) {
			
			// https://regex101.com/
			var re = /(([^\?&=]+)(\[[0-9]\])|([^\?&=]+))=([^&]*)/g;
			var params = {}, e;
			var excludes = options || [];

			if (urlToDeserialize) {
				var url = _decode(urlToDeserialize);
	            if (url.substr(0, 1) == '?') {
	            	url = url.substr(1);
	            }

	            while (e = re.exec(url)) {
	                var k = typeof e[2] === 'undefined' ? e[1] : e[2];
	                if ($.inArray(k, excludes) < 0) {
		                var v = e[5];
		                if (params[k] !== undefined) {
		                    if (!$.isArray(params[k])) {
		                        params[k] = [params[k]];
		                    }
		                    params[k].push(v);
		                } else {
		                    params[k] = v;
		                }
	                }
	            }
	        }
	        return params;
		},
		
		deserializeObjectFromWindowLocation: function(options) {
			
			if (window.location) {
				if (window.location.search) {
					var url = window.location.search.substring(1, window.location.search.length);
					return this.deserializeObjectFromUrl(url, options);
				}
			}
			return {};
		}
		
	};
	
	function _decode(str) {
		return decodeURIComponent(str.replace(/\+/g, ' '));
	}
	
});
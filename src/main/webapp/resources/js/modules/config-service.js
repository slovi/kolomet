define(['jquery'], function($) {
	
	return {
		
		readConfig: function(id) {
			
			var element = $('#' + id + ' > span.config');
			var configHtml = element.html();
			
			var config = JSON.parse(configHtml);
			
			var configuration = {
				configData: config,
				get: function(property, defaultValue) {
					var propertyString = this.configData[property];
					return propertyString ? propertyString : defaultValue;
				},
				getAsInt: function(property, defaultValue) {
					var propertyString = this.configData[property];
					return propertyString ? parseInt(propertyString) : defaultValue; 
				},
				getAsArray: function(property, defaultValue) {
					var arrayPropertyString = this.configData[property];
					return arrayPropertyString ? arrayPropertyString.split(',') : defaultValue; 
				},
				getAsArrayAndConvert: function(property, valueConverter) {
					var convertedArray = new Array(0);
					var array = this.getAsArray(property);
					if (array) {
						for (var i = 0; i < array.length; i++) {
							convertedArray.push(valueConverter(i, array[i], this));
						}
					}
					return convertedArray;
				},
				getEvalAsArrayAndConvert: function(property, valueConverter) {
					var convertedArray = new Array(0);
					var array = eval(this.get(property));
					if (array) {
						for (var i = 0; i < array.length; i++) {
							convertedArray.push(valueConverter(i, array[i], this));
						}
					}
					return convertedArray;
				}
			};
			
			return configuration;
		}
	
	};
	
});
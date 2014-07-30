define(['jquery', 'jquery.ui', 'jquery.number'], function($) {
	
	var sliders = [];
	
	return {
		slider: function(divId, valueFrom, valueTo, maxValueFrom, maxValueTo, step, additionalFunction) {
						
			var parentDiv = $("#" + divId); 
			var slider = $("div", parentDiv); 
			var amountFromInput = $(".amountFromInput", parentDiv); 
			var amountToInput = $(".amountToInput", parentDiv);
			
			slider.slider({
				range: true,
				min: maxValueFrom,
				max: maxValueTo,
				values: [valueFrom, valueTo],
				step: step,
				slide: function(event, ui) {
					amountFromInput.val(ui.values[0]);
					formatCurrency(amountFromInput);
					amountToInput.val(ui.values[1]);
					formatCurrency(amountToInput);
				},
				change: function(event) {
					additionalFunction(parentDiv);
				}		
			});
			sliders[divId] = slider;
			
		}
	};
	
	function formatCurrency(element) {
		var format = "#,##0";
		element.formatNumber({format: format, locale: "cz"});
	}
	
});
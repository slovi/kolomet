define(['jquery', 'jquery.ui', 'jquery.number'], function($) {
	
	var sliders = [];
	
	return {
		
		decorateId: function(divId, changeListener) {
			var parentDiv = $("#" + divId);
			doDecoration(parentDiv, changeListener, sliders);			
		},
	
		decorate: function(expression, changeListener) {
			$(expression).each(function(index, element) {
				doDecoration(element, changeListener, sliders);
			});
		}
	};
	
	function doDecoration(element, changeListener, sliders) {
		
		var html = $('span.config', element).html();
		var config = JSON.parse(html);
		
		var slider = $("div", element); 
		var amountFromInput = $(".amountFromInput", element); 
		var amountToInput = $(".amountToInput", element);
		
		slider.slider({
			range: true,
			min: config.maxValueFrom,
			max: config.maxValueTo,
			values: [config.valueFrom, config.valueTo],
			step: config.step,
			slide: function(event, ui) {
				amountFromInput.val(ui.values[0]);
				formatCurrency(amountFromInput);
				amountToInput.val(ui.values[1]);
				formatCurrency(amountToInput);
			},
			change: function(event) {
				changeListener(element);
			}		
		});
		sliders[$(element).attr('id')] = slider;
	}
	
	function formatCurrency(element) {
		var format = "#,##0";
		element.formatNumber({format: format, locale: "cz"});
	}
	
});
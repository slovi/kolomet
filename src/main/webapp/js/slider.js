define(['jquery', 'jquery_ui'], function($) {
	
	return {
		slider: function(divId, minValue, maxValue, valueFrom, valueTo, step) {
			var parentDiv = $("#" + divId); 
			var slider = $("div", parentDiv); 
			slider.slider({
				range: true,
				min: minValue,
				max: maxValue,
				values: [valueFrom, valueTo],
				step: step,
				slide: function(event, ui) {
					$(".amountFromInput", parentDiv).val(ui.values[0]);
					$(".amountToInput", parentDiv).val(ui.values[1]);
				}
			});
			$(".amountFromInput", parentDiv).val(slider.slider("values", 0));
			$(".amountToInput", parentDiv).val(slider.slider("values", 1));
		}
	};
	
});
define(['jquery', 'jquery_ui'], function($) {
	
	console.log('entering slider function');
	
	return {
		slider: function(divId, minValue, maxValue, defaultValueFrom, defaultValueTo, step) {
			
			var parentDiv = $("#" + divId); 
			var slider = $("div", parentDiv); 
			var amountFromInput = $(".amountFromInput", parentDiv); 
			var amountToInput = $(".amountToInput", parentDiv);
			
			var valueFrom;
			if (amountFromInput.val() == '') {
				valueFrom = defaultValueFrom;
			} else {
				valueFrom = amountFromInput.val();
			}
			
			var valueTo;
			if (amountToInput.val() == '') {
				valueTo = defaultValueTo;
			} else {
				valueTo = amountToInput.val();
			}
			
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
			
			if (amountFromInput.val() == '') {
				amountFromInput.val(slider.slider("values", 0));
			}
			if (amountToInput.val() == '') {
				amountToInput.val(slider.slider("values", 1));
			}
		}
	};
	
});
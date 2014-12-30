define(['jquery', 'jquery.number'], function($) {
	
	return {
		
		multistepForm: function(maxStep, config) {
			
			var beforeStepListener = config.beforeStepListener;
			var afterStepListener = config.afterStepListener;
			
			for (var i = 2; i <= maxStep; i++) {
				$("div.step-" + i).hide();
			}
			$("#proceed").hide();
			
			for (var i = 1; i <= maxStep; i++) {
				$("div.step div a.step-" + i).click(function(event) {
					event.preventDefault();
					var step = $(this).attr("data-step");
					nextStep(parseInt(step), maxStep, beforeStepListener, afterStepListener);					
				});
				$("div.step div.step-" + i + " button.step-" + i).click(function(event) {
					event.preventDefault();
					var step = $(this).attr("data-step");
					nextStep(parseInt(step) + 1, maxStep, beforeStepListener, afterStepListener);
				});			
			}
		},
		
		resetForm: function(id, functionList) {
						
			var form = $("#" + id);
			$("input:reset", form).click(function(event) {			
		        for (var i = 0; i < functionList.length; i++) {
		        	functionList[i](form);
		        }
		    });
					
		},
	
		ajaxTableRowDelete: function(deleteConfirmText) {
			
			$("input.table_ajax_delete").click(function(event) {
				event.preventDefault();
				if (confirm(deleteConfirmText)) {
					var closestForm = $(this).closest("form"); 
					var deleteUrl = closestForm.attr("action");
					$.ajax({
						url: deleteUrl,
						type: 'DELETE',	
						success: function(data) {
							var row = closestForm.closest("tr");  
							row.remove();
						},
						error: function(xhr, status, error) {
							alert(error);
						}
					});
				}
			});
			
		},
		
		ajaxSubmitOnInputChange: function(formId) {
			var form = $("#" + formId);
			var inputs = $("#" + formId + " :input");
			var button = $("#button_filter", form);
			inputs.change(function(event) {
				button.click();
			});			
		},
		
		computeDifferenceOnKeyUp: function(valueInputFirstId, valueInputSecondId, valueInputDifferenceId) {
			
			var differencesHandlerFirstInput = function(event) {
				var secondValue = $("#" + valueInputSecondId); 
				computeDifference($(this).val(), secondValue.val(), valueInputDifferenceId);
			};
			var differencesHandlerSecondInput = function(event) {
				var firstValue = $("#" + valueInputFirstId);
				computeDifference(firstValue.val(), $(this).val(), valueInputDifferenceId);
			};
			
			$("#" + valueInputFirstId).keyup(differencesHandlerFirstInput).blur(differencesHandlerFirstInput);
			$("#" + valueInputSecondId).keyup(differencesHandlerSecondInput).blur(differencesHandlerSecondInput);
			computeDifference($("#" + valueInputFirstId).val(), $("#" + valueInputSecondId).val(), valueInputDifferenceId);
		}
	
	};
	
	function nextStep(step, maxStep, beforeStepListener, afterStepListener) {
		
		var next = true;
		if (beforeStepListener) {
			next = beforeStepListener(step);
		}
		
		if (next) {
			for (var i = 1; i <= maxStep; i++) {
				if (i != step) {
					$("#proceed").hide();
					$("div.step-" + i).hide();
					$("div.step div a.step-" + i).attr("class", "navi step-" + i);
				}
			}
			$("div.step div a.step-" + step).attr("class", "navi step-" + step + " current");
			if (step == maxStep) {
				$("#proceed").show();
				$("p.name").html($("input[name='name']").val());
				$("p.place_type").html($("#_placeType_id").val());
				$("span.bike_road_nr").html($("#_bikeRoadNr_id").val());
				$("span.description").html($("textarea[name='description']").val());
				$("a.descriptionLink").html($("#_descriptionLink_id").val());
				$("a.descriptionLink").attr("href", $("#_descriptionLink_id").val());
				$("span.gps").html($("input[name='gpsLocation.north']").val() + " " + $("input[name='gpsLocation.west']").val());
				$("span.region").html($("#_region_id").val());
			} else {
				$("div.step-" + step + " button.step").show();
			}
			$("div.step-" + step).show("slow");
		}
		
		if (afterStepListener) {
			afterStepListener(step);
		}
	}
	
	function formatCurrency(element) {
		var format = "#,##0";
		element.formatNumber({format: format, locale: "cz"});
	}
	
	function computeDifference(firstValue, secondValue, valueInputDifferenceId) {
		var resultElement = $("#" + valueInputDifferenceId); 
		var resultFirstValue = firstValue ? firstValue : 0;
		var resultSecondValue = secondValue ? secondValue : 0;
		resultElement.val(secondValue ? resultFirstValue - resultSecondValue : 0);
		formatCurrency(resultElement);
	}
	
});
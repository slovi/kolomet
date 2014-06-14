define(['jquery', 'jquery_number', 'main'], function($) {
	
	return {
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
			$("#" + valueInputFirstId).keyup(function(event) {
				var secondValue = $("#" + valueInputSecondId);
				if (secondValue.val() && $(this).val()) {
					computeDifference($(this).val(), secondValue.val(), valueInputDifferenceId);
				}
			});
			$("#" + valueInputSecondId).keyup(function(event) {
				var firstValue = $("#" + valueInputFirstId);
				if (firstValue.val() && $(this).val()) {
					computeDifference(firstValue.val(), $(this).val(), valueInputDifferenceId);
				}
			});
			computeDifference($("#" + valueInputFirstId).val(), $("#" + valueInputSecondId).val(), valueInputDifferenceId);
		}
	
	};
	
	function formatCurrency(element) {
		var format = "#,##0";
		element.formatNumber({format: format, locale: "cz"});
	}
	
	function computeDifference(firstValue, secondValue, valueInputDifferenceId) {
		var resultElement = $("#" + valueInputDifferenceId); 
		resultElement.val(firstValue - secondValue);
		formatCurrency(resultElement);
	}
	
});
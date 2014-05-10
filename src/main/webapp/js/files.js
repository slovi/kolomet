define(['jquery'], function($) {

	var actualIndex = 1;
	
	return {
		files: function (id, max) {								
			
			$("a.multiple_input_add").click(function(e) {
				e.preventDefault();
				if (actualIndex < max) {
					$("#" + id + actualIndex++).show();
				}
			});
			$("input.multiple_input_remove").click(function(e) {
				e.preventDefault();								
				var index = parseInt($(this).attr("data-index"));
				if (index < (max - 1)) {
					for (var i = index + 1; i < max; i++) {
						var from = $("#" + id + i);
						var to = $("#" + id + (i - 1));
						if (from.is(":visible")) {
							var inputFrom = $("input:file", from);
							var inputTo = $("input:file", to);
							var cloned = inputFrom.clone();
							inputFrom.attr("name", inputTo.attr("name"));
							inputFrom.attr("id", inputTo.attr("id"));
							inputFrom.attr("tabindex", inputTo.attr("tabindex"));
							inputFrom.replaceWith(cloned);
							inputTo.replaceWith(inputFrom);
						}
					}
				}
				if (actualIndex > 1) {
					var toHide = $("#" + id + --actualIndex);
					var inputToHide = $("input:file", toHide);
					inputToHide.val("");
					toHide.hide();
				}
			});
		}
	};

});

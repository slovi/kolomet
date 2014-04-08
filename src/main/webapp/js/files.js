define(['jquery'], function($) {

	console.log("entering files functions");
	
	var actualIndex = 1;
	
	return {
		files: function (id, max) {								
			
			$("a.multiple_input_add").click(function(e) {
				e.preventDefault();
				if (actualIndex < max) {
					$("#" + id + actualIndex++).show();
				}
			});
			$("a.multiple_input_remove").click(function(e) {
				e.preventDefault();
				if (actualIndex > 1) {
					$("#" + id + --actualIndex).hide();
				}
			});
		}
	};

});

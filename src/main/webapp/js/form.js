define(['jquery'], function($) {
	
	return {
		resetForm: function(id, functionList) {
						
			var form = $("#" + id);
			$("input:reset", form).click(function() {       
		        for (var i = 0; i < functionList.length; i++) {
		        	functionList[i](form);
		        }
		    });
			
		}
	};
	
});
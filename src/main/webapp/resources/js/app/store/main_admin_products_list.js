require(['../common'], function (common) {
	
	require(['main_default_admin'], function(mainDefaultPublic) {
		
		require(['form'], function(form) {
			
			functions = [
				function(resetedForm) {
					window.location.assign($("#i_product_list a").attr("href"));
				}
			];
			
			form.resetForm("filterForm", functions);
			
		});
	
	});

});
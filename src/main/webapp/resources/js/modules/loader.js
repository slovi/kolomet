define(['jquery', 'jquery.block-ui'], function($) {
	
	return {
		
		show: function(contextPath) {
			
			$.blockUI({ 
				message: '<h1><img src=\"/kolomet/resources/images/ajax-loader-100.gif\" /></h1>',
				onOverlayClick: $.unblockUI,
				css: { 
					width: '20%',
					border: 'none', 
					padding: '15px', 
					backgroundColor: 'transparent', 
					'-webkit-border-radius': '10px', 
					'-moz-border-radius': '10px', 
					opacity: 1, 
					color: '#fff',
					cursor: 'default'					
				},
				overlayCSS:  { 
			        opacity: 0,
			        cursor: 'default'
			    }
			});
			
		},
		
		hide: function() {
			
			$.unblockUI();
			
		}
	};
	
});
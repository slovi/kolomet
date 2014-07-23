define(['jquery', 'jquery_maphilight'], function($) {

	return {
		hilight: function (mapId, options) {								
			
			$("#" + mapId).maphilight(options);
			
			// Create the tooltips only when document ready
			$(document).ready(function()
			{
			   // Use the each() method to gain access to each elements attributes
			   $('area').each(function()
			   {
			      $(this).qtip(
			      {
			        content: $(this).attr('alt'), // Use the ALT attribute of the area map
					 		 position: { corner: { target: 'rightMiddle', tooltip: 'leftMiddle' } },
			        style: {
					 		 		 'font-size': 12,
					 		 		 background: '#b22c1b',
					 		 		 color: '#ffffff',
					 		 		 textAlign: 'center',
			            tip: false,
					 		 		 border: {
					 		 		 		 width: 0,
					 		 		 		 radius: 0
					 		 		 }
			         }
			      });
			   });
			});
			
		}
	};

});

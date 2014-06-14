define(['jquery', 'jquery_lean', 'main'], function($) {
	
	return {
		prepare: function() {
			
			$("#login_modal").leanModal({top : 200, overlay : 0.4, closeButton: ".modal_close"});
			
			$("#login_form").submit(function(event) {
				
				event.preventDefault();		
				
				var form = $(this);
				
				var posting = $.post(form.attr( "action" ), form.serialize());
				posting.done(function(data) {
					if ("OK" == data) {
						location.reload();
					} else {
						var errorHolder = $( ".error", form ); 
						errorHolder.html( data );
					}
				});
			});
		}
	};
	
});
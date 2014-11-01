define(['jquery', 'jquery.lean'], function($) {
	
	return {
		prepare: function() {
			
			var loginModal = $("#login_modal"); 

			if (loginModal) {
				loginModal.leanModal({top : 200, overlay : 0.4, closeButton: ".modal_close"});
			
				$("#j_username").keyup(function(event) {
					var paramString = "&email=";
					var href = $("#link_forgotten_password").attr("href");
					var lastIndex = href.lastIndexOf(paramString);
					if (lastIndex > 0) {
						href = href.substring(0, lastIndex) + paramString + $(this).val();
					} else {
						href += paramString + $(this).val();
					}
					$("#link_forgotten_password").attr("href", href);
				});
				
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
		}
		
	};
	
});
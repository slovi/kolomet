require(['../common'], function (common) {
	
	require(['main_default_admin', 'input-file', 'fb'], function(mainDefaultPublic, inputFile, fb) {
		
		require(['form'], function(form) {
			
	    	inputFile.decorateId('newsitem_files', {});
			
	    	fb.init();
	    	
	    	var facebookAppOwner = window.app.facebookAppOwner;
	    	var facebookAppOwnerId = window.app.facebookAppOwnerId;
	    	
	    	var sendToFacebookInput = $('#_sendToFacebook_id');
	    	
	    	var id = 'sendToFacebookAcessToken';
	    	var applyAccessTokenToInput = function(id, accessToken) {
	    		
	    		var resultToken;
	    		FB.api('/me/accounts', 'get', {}, function(response) {
	    			
	    			console.log(response);
	    			if (response.data) {
	    				for (var i = 0; i < response.data.length; i++) {
	    					if (response.data[i].id === facebookAppOwnerId) {
	    						resultToken = response.data[i].access_token;
	    						break;
	    					}
	    				}
	    			}
	    			
	    			if (!resultToken) {
	    				alert('Nemáte právo spravovat fb stránku ' + facebookAppOwner);
	    				sendToFacebookInput.attr('arria-pressed', false);
	    			} else {
	    				$('#' + id).val(resultToken);    				
	    			}
	    			
	    		});
	    	}
	    	
	    	sendToFacebookInput.click(function(event) { 
	    		
	    		var value = $(this).attr('aria-pressed');
	    		if (value === 'true') {
	    			FB.getLoginStatus(function(response) {
		    			if (response.status === 'connected') {
		    			    applyAccessTokenToInput(id, response.authResponse.accessToken);
		    			} else {
			    			FB.login(function(response) {
			    				applyAccessTokenToInput(id, response.authResponse.accessToken);
			    			}, {
			    				scope: 'publish_actions,manage_pages'
			    			});
			    		}
	    			});
	    		} else {
	    			
	    		}
	    		
	    	});
	    	
    	});
	
	});

});
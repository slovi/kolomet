require(['../common'], function (common) {
	
	// detail
    require(['side_menu', 'login', ], function(sideMenu, login) {
    	
    	sideMenu.prepare();
    	
    	login.prepare();
    	
    });
});

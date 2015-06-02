require(['../common'], function (common) {
	
	require(['main_default_public'], function(mainDefaultPublic) {
		
	    require(['ajax-link', 'ajax-submit', 'map-places', 'jquery.history', 'fb', 'partner-links', 'place-banners', 'http-service', 'jquery'], 
	    		function(ajaxLink, ajaxSubmit, placesMap, history, fb, partnerLinks, placeBanners, httpService, $) {
	    	
	    	var configHtml = $('#map_config').html();
	    	var config = JSON.parse(configHtml);
	    	var excludedHistoryParams = ['ajaxSource', 'fragments', 'highlight', 'user'];
	    	
	    	var updateFacebookLink = function(data) {
	    	}
	    	
	    	// model used to filtering
	    	var placeFilterDto = httpService.deserializeObjectFromWindowLocation();
	    	if (typeof placeFilterDto.usedFilter === 'undefined' || placeFilterDto.usedFilter === 'false') {
	    		placeFilterDto.placeTypes = eval(config.placeTypes);
	    		placeFilterDto.defaultZoom = 7;
	    		placeFilterDto.defaultRegionZoom = 9;
	    		placeFilterDto.defaultCenterWest = 15.5;
	    		placeFilterDto.defaultCenterNorth = 49.8; 
	    	}

			var mapOptions = {
				zoom: placeFilterDto.defaultZoom,
			};

			var placesMap = placesMap.createMap(document.getElementById('map-canvas'), mapOptions, config);
			placesMap.init(placeFilterDto, updateFacebookLink);
			partnerLinks.render(placeFilterDto);
			placeBanners.render(placeFilterDto);
			
			History.Adapter.bind(window, 'statechange', function() {
				var State = History.getState();
				History.log('statechange:', State.data, State.title, State.url);
			});
			
			// sort links
			sortLinks();
			
			$('#my_places_link_anonymous').click(function(event) {
	    		event.preventDefault();
	    		$("#login_modal").click();
	    	});
			
			$('#my_places_link').click(function(event) {
				event.preventDefault();
				if (!placesMap.isMyPlaces()) {
					$(this).removeClass('actual');
					$(this).html('&nbsp;&nbsp;' + config.allPlacesText + '&nbsp;&nbsp;');
					placesMap.updateMapToMyPlaces();
				} else {
					_setMyPlacesDefault($(this), placesMap, config);
				}
			});
			
			// form fields
			ajaxSubmit.decorate(
					'form#place_filter_form input[type=checkbox]',
					'click',
					function(element, params) {
						params.fragments = 'body_footer,body_footer_hidden';
						return $.extend(placeFilterDto, params);
					},
					function(element, params) {
						
						$.extend(placeFilterDto, params);
						placesMap.updateMap(placeFilterDto, updateFacebookLink);
						
						History.pushState(null, 'Cyklovýlety a cykloturistika', '?' + httpService.serializeObjectToUrl(placeFilterDto, excludedHistoryParams));
						sortLinks();
						_setMyPlacesDefault($('#my_places_link'), placesMap, config);
					});
						
			// menu items
			ajaxLink.decorate(
					'div#region-side-menu a.ajaxLink', 
					'click', 
					function(element, params) {
						params.fragments = 'body_footer,body_footer_hidden';
						return $.extend(placeFilterDto, params);
					},
					function(element, params) {
						
						$("ul#side_menu_body_regions li a").removeClass('current');
						$(element).addClass('current');						
						
						placesMap.updateMap(placeFilterDto, updateFacebookLink);
						placesMap.setMapPosition(placeFilterDto);
						partnerLinks.render(placeFilterDto);
						placeBanners.render(placeFilterDto);
						sortLinks();
						_setMyPlacesDefault($('#my_places_link'), placesMap, config);
						
						History.pushState(null, 'Cyklovýlety a cykloturistika', '?' + httpService.serializeObjectToUrl(placeFilterDto, excludedHistoryParams));
					});
			
			function sortLinks() {
				ajaxLink.decorate(
						'div.sorting a', 
						'click',
						function(element, params) {
							params.fragments = 'body_footer,body_footer_hidden';
							return $.extend(placeFilterDto, params);
						},
						function(element, params) {
							sortLinks();
							_setMyPlacesDefault($('#my_places_link'), placesMap, config);
							History.pushState(null, 'Cyklovýlety a cykloturistika', '?' + httpService.serializeObjectToUrl(placeFilterDto, excludedHistoryParams));
						});
			}
			
		    var animateNewsItemTips = function () {
		    	
		    	fb.initSharerButtons('.fb_share');
				
				var i = 0;
				var tips = $('#news_item_tips div.tip_wrapper');
				var tipContent = $('#news_item_tips div.tip_wrapper div.tip_content');
				
				tipContent.each(function(index, element) {
					var tip = $(element);
					var img = $('img', tip);
					var button = $('a.fb_share', tip.parent());
					button.attr('data-image', img.attr('src'));
				});
				
				tipContent.css('cursor', 'pointer');
				tipContent.click(function() {
					location.href=$(this).data('tip-url');
				});
			    
			    setTimeout(function() {
			    	animateNewsItemTip(tips, i);
			    }, 10000);
			}
		    
		    var animateNewsItemTip = function(tips, i) { 
				
		    	var tip = $(tips.get(i));
		    	var nextIndex = ((i >= tips.length - 1) ? 0 : i + 1); 
		    	var nextTip = $(tips.get(nextIndex));
		    	
		    	tip.animate({
		    		
		    		opacity: 0
		    	
		    	}, 3000, function() {
		    		
		    		tip.css('display', 'none');
		    		nextTip.css('opacity', 0);
		    		nextTip.css('display', 'block');
		    		nextTip.animate({
		    			opacity: 1
		    		}, 3000, function() {
		    			setTimeout(function() {
		    				animateNewsItemTip(tips, nextIndex);
		    			}, 10000);
		    		});
		    		
		    	});
		    	
		    }
		    
		    animateNewsItemTips();	    		  

	    });
	    
	    var _setMyPlacesDefault = function(element, placesMap, config) {
	    	element.addClass('actual');
	    	element.html('&nbsp;&nbsp;' + config.myPlacesText + '&nbsp;&nbsp;');
			placesMap.updateMapToAllPlaces();
	    }
	
	});

});

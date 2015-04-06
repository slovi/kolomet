package cz.kolomet.web.pub;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.base.Function;
import com.google.common.collect.Lists;

import cz.kolomet.domain.Place;
import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RateType;
import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.dto.PlaceFilterDto;
import cz.kolomet.repository.PlaceRepository;
import cz.kolomet.repository.PlaceSpecifications;
import cz.kolomet.service.PlaceService;
import cz.kolomet.service.PlaceTypeService;
import cz.kolomet.service.RateService;

@RequestMapping("/public/places")
@Controller("publicPlaceController")public class PlaceController extends AbstractPublicController {
	
	private static final int TOP_PLACES_NUMBER = 3;
	
	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private PlaceRepository placeRepository;
	
	@Autowired
	private RateService rateService;

	@Autowired
	private PlaceTypeService placeTypeService;
	
	@ResponseBody
	@RequestMapping(value = "/assign", method = RequestMethod.POST)
	public String assingVisited(@RequestParam("placeId") Long placeId, @RequestParam("beenThere") Boolean beenThere) {
		placeService.assignVisitedUser(placeId, beenThere, getActualUser());
		return "OK";
	}
	
	@RequestMapping(value = "/rate", method = RequestMethod.POST, produces = "text/html")
    public String rate(@Valid Rate rate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
		rate.setIpAddress(httpServletRequest.getRemoteAddr());
        rateService.saveRate(rate);        
        return show(rate.getEntityId(), uiModel, httpServletRequest);
    }
	
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel, HttpServletRequest request) {
        
    	addDateTimeFormatPatterns(uiModel);
    	
    	Place place = placeService.findPlace(id);
        uiModel.addAttribute("place", place);
        uiModel.addAttribute("itemId", id);
        uiModel.addAttribute("newsBanners", newsItemService.findPlaceNewsBanners(place.getRegion(), getNewsItemsPageRequest()));
        
        List<Rate> existingRates = rateService.findRate(RateType.PLACE, id, request.getRemoteAddr());
        uiModel.addAttribute("isRated", !existingRates.isEmpty());
        uiModel.addAttribute("pageTitleCode", "page_place_detail_title_" + place.getPlaceType().getCodeKey());
        uiModel.addAttribute("pageDescriptionCode", "page_place_detail_description_" + place.getPlaceType().getCodeKey());
        if (getActualUser() != null) {
        	uiModel.addAttribute("isVisited", place.getVisitedUsers().contains(getActualUser()));
        } else {
        	uiModel.addAttribute("isVisited", false);
        }
        
        uiModel.addAttribute("ogTitleCode", "page_place_detail_og_title_"  + place.getPlaceType().getCodeKey());
        uiModel.addAttribute("ogTitleArgs", place.getName());
        uiModel.addAttribute("ogDescriptionCode", "page_place_detail_og_description_" + place.getPlaceType().getCodeKey());
        uiModel.addAttribute("ogType", "kolomet:place");
		if (!place.getPhotos().isEmpty()) {
			uiModel.addAttribute("ogImage", "http://www.kolomet.cz/file/" + place.getPhotos().get(0).getDetailPhotoUrl());
		}
        
        addDateTimeFormatPatterns(uiModel);
        return "public/places/show";
    }

    @ResponseBody
    @RequestMapping(value = "/partners", produces = "application/json")
    public String listNewsItemsJson(@RequestParam(value = "region", required = false) Region region) {
    	return jsonSerializer.toJsonArray(newsItemService.findAllPartnerLinksDtos(region));
    }
    
    @ResponseBody
    @RequestMapping(value = "/banners", produces = "application/json")
    public String listNewsItemsBannersJson(@RequestParam(value = "region", required = false) Region region) {
    	return jsonSerializer.toJsonArray(newsItemService.findPlaceNewsBannersDtos(region, getNewsItemsPageRequest()));
    }
    
    @ResponseBody
    @RequestMapping(produces = "application/json")
    public String listJson(@Valid PlaceFilterDto placeFilter, Model uiModel) {
    	if (placeFilter.existsPlaceType()) {
    		Specification<Place> placeSpecification = PlaceSpecifications.forPlaceFilter(placeFilter);
    		return jsonSerializer.toJsonArray(placeService.findPlaceDtos(placeSpecification, getActualUser()));
    	} else {
    		return "{}";
    	}
    }
    
	@RequestMapping(produces = "text/html")
    public String list(@Valid PlaceFilterDto placeFilter, Model uiModel, HttpServletRequest request) {
		
		List<PlaceType> placeTypes = placeTypeService.findAllPlaceTypes();
		uiModel.addAttribute("placeTypes", placeTypes);
		uiModel.addAttribute("placeTypesJson", jsonSerializer.toJsonArray(Lists.transform(placeTypes, new Function<PlaceType, Long>() {
			@Override
			public Long apply(PlaceType input) {
				return input.getId();
			}
		})));
		
		if (!placeFilter.isUsedFilter()) {
			placeFilter.setPlaceTypes(placeTypes);
			uiModel.addAttribute("placeFilter", placeFilter);
		} else {
			uiModel.addAttribute("placeFilter", placeFilter);
		}

		Specification<Place> placeSpecification = PlaceSpecifications.forPlaceFilter(placeFilter);
		if (placeFilter.existsPlaceType()) {
			uiModel.addAttribute("topPlaces", placeRepository.findAllWithoutCountQuery(
					placeSpecification, new PageRequest(0, TOP_PLACES_NUMBER, PlaceSpecifications.getTopSort(placeFilter.isActual()))));
		} else {			
			uiModel.addAttribute("topPlaces", new ArrayList<Place>());
		}
		uiModel.addAttribute("newsBannersRenderedByJson", true);
		uiModel.addAttribute("newsItemTips", newsItemService.findAllWeekendTips());
		uiModel.addAttribute("pageTitleCode", "page_place_list_title_all");
        uiModel.addAttribute("pageDescriptionCode", "page_place_list_description");
		
        addDateTimeFormatPatterns(uiModel);
        return "public/places/list";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("place_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("place_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
}
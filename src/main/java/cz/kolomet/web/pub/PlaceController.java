package cz.kolomet.web.pub;

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

import cz.kolomet.domain.Place;
import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RateType;
import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.dto.PlaceFilterDto;
import cz.kolomet.repository.PlaceRepository;
import cz.kolomet.repository.PlaceSpecifications;
import cz.kolomet.service.PlaceService;
import cz.kolomet.service.PlaceTypeService;
import cz.kolomet.service.RateService;

@RequestMapping("/public/places")
@Controller("publicPlaceController")
public class PlaceController extends AbstractPublicController {
	
	private static final int TOP_PLACES_NUMBER = 3;
	
	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private PlaceRepository placeRepository;
	
	@Autowired
	private RateService rateService;

	@Autowired
	private PlaceTypeService placeTypeService;
	
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
        
        List<Rate> existingRates = rateService.findRate(RateType.PLACE, id, request.getRemoteAddr());
        uiModel.addAttribute("isRated", !existingRates.isEmpty());
        uiModel.addAttribute("pageTitleCode", "page_place_detail_title_" + place.getPlaceType().getCodeKey());
        uiModel.addAttribute("pageDescriptionCode", "page_place_detail_description_" + place.getPlaceType().getCodeKey());
        
        addDateTimeFormatPatterns(uiModel);
        return "public/places/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@Valid PlaceFilterDto placeFilter,  Model uiModel) {
		
		List<PlaceType> placeTypes = placeTypeService.findAllPlaceTypes();
		uiModel.addAttribute("placeTypes", placeTypes);
		
		if (!placeFilter.isUsedFilter()) {
			PlaceFilterDto placeFilterDto = new PlaceFilterDto();
			placeFilterDto.setPlaceTypes(placeTypes);
			uiModel.addAttribute("placeFilter", placeFilterDto);
		} else {
			uiModel.addAttribute("placeFilter", placeFilter);
		}
		
		Specification<Place> placeSpecification = PlaceSpecifications.forPlaceFilter(placeFilter);
		uiModel.addAttribute("placesJson", jsonSerializer.toJsonArray(placeService.findPlaceDtos(placeSpecification)));
		uiModel.addAttribute("topPlaces", placeRepository.findAllWithoutCountQuery(
				placeSpecification, new PageRequest(0, TOP_PLACES_NUMBER, PlaceSpecifications.getTopSort())));
		
		if (placeFilter.getRegion() != null) {
			uiModel.addAttribute("pageTitleCode", "page_place_list_title_filtered");
			uiModel.addAttribute("pageTitleArgs", " - " + placeFilter.getRegion().getCodeDescription());
		} else {
			uiModel.addAttribute("pageTitleCode", "page_place_list_title_all");
		}
        uiModel.addAttribute("pageDescriptionCode", "page_place_list_description");
		
        addDateTimeFormatPatterns(uiModel);
        return "public/places/list";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("place_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("place_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
}
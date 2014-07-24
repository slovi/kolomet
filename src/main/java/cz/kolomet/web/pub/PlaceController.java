package cz.kolomet.web.pub;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.Place;
import cz.kolomet.domain.RateType;
import cz.kolomet.dto.PlaceFilterDto;
import cz.kolomet.repository.PlaceSpecifications;
import cz.kolomet.service.PlaceService;
import cz.kolomet.service.RateService;

@RequestMapping("/public/places")
@Controller("publicPlaceController")
@RooWebScaffold(path = "public/places", formBackingObject = Place.class, create = false, delete = false, update = false)
public class PlaceController extends AbstractPublicPlacesController {
	
	private static final int TOP_PLACES_NUMBER = 3;
	
	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private RateService rateService;
	
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel, HttpServletRequest request) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("place", placeService.findPlace(id));
        uiModel.addAttribute("itemId", id);
        uiModel.addAttribute("isRated", rateService.findRate(RateType.PLACE, id, request.getRemoteAddr()));
        addDateTimeFormatPatterns(uiModel);
        return "public/places/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@Valid PlaceFilterDto placeFilter,  Model uiModel) {
		
		Specification<Place> placeSpecification = PlaceSpecifications.forPlaceFilter(placeFilter);
		uiModel.addAttribute("placesJson", Place.toJsonArray(placeService.findPlaceEntries(placeSpecification)));
		uiModel.addAttribute("topPlaces", placeService.getTopPlaces(placeSpecification, TOP_PLACES_NUMBER));
        addDateTimeFormatPatterns(uiModel);
        return "public/places/list";
    }
	
}
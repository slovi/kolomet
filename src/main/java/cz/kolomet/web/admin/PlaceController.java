package cz.kolomet.web.admin;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.domain.Place;
import cz.kolomet.security.ApplicationUserDetails;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.PlaceCommentService;
import cz.kolomet.service.PlacePhotoUrlService;
import cz.kolomet.service.PlaceTypeService;
import cz.kolomet.service.RegionService;
import cz.kolomet.web.pub.AbstractPublicPlacesController;

@RequestMapping("/admin/places")
@Controller("adminPlaceController")
@RooWebScaffold(path = "admin/places", formBackingObject = Place.class)
public class PlaceController extends AbstractPublicPlacesController {
	
	@Autowired
	private PlacePhotoUrlService placePhotoUrlService;
	
	@Autowired
	private PlaceTypeService placeTypeService;
	
	@Autowired
	private PlaceCommentService placeCommentService;
	
	@Autowired
	private ApplicationUserService applicationUserService;
	
	@Autowired
	private RegionService regionService;
	
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        return "redirect:/public/places/" + id;
    }
    
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<Place> page = null;
        	ApplicationUserDetails applicationUserDetails = ApplicationUserDetails.getActualApplicationUserDetails();
        	if (applicationUserDetails.isPlacesOwn()) {
        		final Long userId = applicationUserDetails.getUserId();
        		page = placeService.findPlaceEntries(new Specification<Place>() {
					
					@Override
					public Predicate toPredicate(Root<Place> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
						return builder.equal(root.get("createdBy.id"), userId);
					}
				}, pageable);
        	} else {
        		page = placeService.findPlaceEntries(null, pageable);
        	}
        	uiModel.addAttribute("places", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("places", placeService.findAllPlaces());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/places/list";
    }
	
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Place place, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, place);
            return "admin/places/create";
        }
        uiModel.asMap().clear();
        placeService.savePlace(place);
        
        savePhotos(place, placePhotoUrlService, httpServletRequest.getSession().getId(), place.getFileNames());
        
        return "redirect:/public/places/" + place.getId();
    }
    
    public void populateEditForm(Model uiModel, Place place) {
        uiModel.addAttribute("place", place);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("placecomments", placeCommentService.findAllPlaceComments());
        uiModel.addAttribute("placetypes", placeTypeService.findAllPlaceTypes());
        uiModel.addAttribute("regions", regionService.findAllRegions());
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Place place, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, place);
            return "admin/places/update";
        }
        
        uiModel.asMap().clear();
        
        Place existingPlace = placeService.findPlace(place.getId());
        place.setNrOfRankings(existingPlace.getNrOfRankings());
        place.setQualityRanking(existingPlace.getQualityRanking());
        
        placeService.updatePlace(place);      
        
        savePhotos(place, placePhotoUrlService, place.getContents());
        
        return "redirect:/public/places/" + place.getId();
    }
	
}

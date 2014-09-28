package cz.kolomet.web.admin;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.domain.Place;
import cz.kolomet.domain.PlacePhotoUrl;
import cz.kolomet.repository.PlaceSpecifications;
import cz.kolomet.security.ApplicationUserDetails;
import cz.kolomet.service.PlacePhotoUrlService;
import cz.kolomet.service.PlaceTypeService;
import cz.kolomet.service.RegionService;
import cz.kolomet.web.pub.AbstractPublicController;
import flexjson.JSONSerializer;

@RequestMapping("/admin/places")
@Controller("adminPlaceController")
@RooWebScaffold(path = "admin/places", formBackingObject = Place.class)
public class PlaceController extends AbstractPublicController {
	
	@Autowired
	private PlacePhotoUrlService placePhotoUrlService;
	
	@Autowired
	private PlaceTypeService placeTypeService;
	
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
        		page = placeService.findPlaceEntries(PlaceSpecifications.ownPlaces(userId), pageable);
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
        
        savePhotos(place, placePhotoUrlService, httpServletRequest.getSession().getId(), place.getFileInfos());
        
        return "redirect:/public/places/" + place.getId();
    }
    
    public void populateEditForm(Model uiModel, Place place) {
        uiModel.addAttribute("place", place);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("addedFiles", new JSONSerializer().serialize(place.getFileInfos()));
        uiModel.addAttribute("uploadedFiles", PlacePhotoUrl.toJsonArray(place.getPlacePhotoUrls(), new String[] {"id", "fileName"}));
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
        
        savePhotos(place, placePhotoUrlService, httpServletRequest.getSession().getId(), place.getFileInfos());
        
        return "redirect:/public/places/" + place.getId();
    }
	
}

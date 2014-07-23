package cz.kolomet.web.admin;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.domain.Place;
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
	
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Place place, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, place);
            return "admin/places/create";
        }
        uiModel.asMap().clear();
        placeService.savePlace(place);
        
        savePhotos(place, placePhotoUrlService, place.getContents());
        
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

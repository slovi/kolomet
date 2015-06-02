package cz.kolomet.web.admin;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import cz.kolomet.domain.Place;
import cz.kolomet.repository.PlaceSpecifications;
import cz.kolomet.security.ApplicationUserDetails;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.PlacePhotoUrlService;
import cz.kolomet.service.PlaceService;
import cz.kolomet.service.PlaceTypeService;
import cz.kolomet.service.RegionService;
import cz.kolomet.service.exception.ExistingPlaceException;

@RequestMapping("/admin/places")
@Controller("adminPlaceController")
public class PlaceController extends AbstractAdminController {
	
	@Autowired
	private PlacePhotoUrlService placePhotoUrlService;
	
	@Autowired
	private PlaceTypeService placeTypeService;
	
	@Autowired
	private RegionService regionService;
	
	@Autowired
	private ApplicationUserService applicationUserService;
	
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        return "redirect:public/places/" + id;
    }
    
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<Place> page = null;
        	ApplicationUserDetails applicationUserDetails = getActualUserDetails();
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
        try {
        	if (!getActualUserDetails().isPlacesAll()) {
        		place.setOwner(getActualUser());
        	}
        	placeService.savePlace(place);
        	savePhotos(place, placePhotoUrlService, httpServletRequest.getSession().getId(), place.getFileInfos());
        	uiModel.asMap().clear();
        	return "redirect:public/places/" + place.getId();
        } catch (ExistingPlaceException e) {
        	bindingResult.reject(e.getCode(), e.getArguments(), "");
        	populateEditForm(uiModel, place);
            return "admin/places/create";
        }
    }
    
    void populateEditForm(Model uiModel, Place place) {
        uiModel.addAttribute("place", place);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("addedFiles", jsonSerializer.toJsonArray(place.getFileInfos()));
        uiModel.addAttribute("uploadedFiles", jsonSerializer.toJsonArray(place.getPlacePhotoUrls(), new String[] {"id", "fileName"}));
        uiModel.addAttribute("placetypes", placeTypeService.findAllPlaceTypes());
        uiModel.addAttribute("regions", regionService.findAllRegions());
        if (getActualUserDetails().isPlacesAll()) {
        	place.setOwner(getActualUser());
        	uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        }
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Place place, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, place);
            return "admin/places/update";
        }        
        
        // v service metode se kontroluje, zda createdBy se rovna aktualne prihlasenemu
        // idealni by bylo pouziti dto objektu
        // TODO - predelat na dto
        Place existingPlace = placeService.findPlace(place.getId());
        existingPlace.setNrOfRankings(place.getNrOfRankings());
        existingPlace.setQualityRanking(place.getQualityRanking());
        existingPlace.setAddress(place.getAddress());
        existingPlace.setBikeRoadNr(place.getBikeRoadNr());
        existingPlace.setDescription(place.getDescription());
        existingPlace.setDescriptionLink(place.getDescriptionLink());
        existingPlace.setGpsLocation(place.getGpsLocation());
        existingPlace.setName(place.getName());
        existingPlace.setNrOfRankings(place.getNrOfRankings());
        existingPlace.setPlaceType(place.getPlaceType());
        existingPlace.setQualityRanking(place.getQualityRanking());
        existingPlace.setRegion(place.getRegion());
        if (getActualUserDetails().isPlacesAll()) {
    		existingPlace.setOwner(place.getOwner());
    	}
    
        try {
	        placeService.updatePlace(existingPlace);      
	        savePhotos(place, placePhotoUrlService, httpServletRequest.getSession().getId(), place.getFileInfos());
	        uiModel.asMap().clear();
	        return "redirect:public/places/" + place.getId();
	    } catch (ExistingPlaceException e) {
	    	bindingResult.reject(e.getCode(), e.getArguments(), "");
	    	populateEditForm(uiModel, place);
	        return "admin/places/update";
	    }
    }
	

	@Autowired
    PlaceService placeService;

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Place());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (placeTypeService.countAllPlaceTypes() == 0) {
            dependencies.add(new String[] { "placetype", "admin/placetypes" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "admin/places/create";
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, placeService.findPlace(id));
        return "admin/places/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Place place = placeService.findPlace(id);
        placeService.deletePlace(place);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:admin/places";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("place_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("place_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
}

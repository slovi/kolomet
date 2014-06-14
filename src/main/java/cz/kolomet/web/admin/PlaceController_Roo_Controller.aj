// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web.admin;

import cz.kolomet.domain.Place;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.PlaceService;
import cz.kolomet.web.admin.PlaceController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PlaceController_Roo_Controller {
    
    @Autowired
    PlaceService PlaceController.placeService;
    
    @Autowired
    ApplicationUserService PlaceController.applicationUserService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PlaceController.create(@Valid Place place, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, place);
            return "admin/places/create";
        }
        uiModel.asMap().clear();
        placeService.savePlace(place);
        return "redirect:/admin/places/" + encodeUrlPathSegment(place.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PlaceController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Place());
        return "admin/places/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PlaceController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("place", placeService.findPlace(id));
        uiModel.addAttribute("itemId", id);
        return "admin/places/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PlaceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("places", placeService.findPlaceEntries(firstResult, sizeNo));
            float nrOfPages = (float) placeService.countAllPlaces() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("places", placeService.findAllPlaces());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/places/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PlaceController.update(@Valid Place place, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, place);
            return "admin/places/update";
        }
        uiModel.asMap().clear();
        placeService.updatePlace(place);
        return "redirect:/admin/places/" + encodeUrlPathSegment(place.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PlaceController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, placeService.findPlace(id));
        return "admin/places/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PlaceController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Place place = placeService.findPlace(id);
        placeService.deletePlace(place);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/places";
    }
    
    void PlaceController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("place_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("place_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void PlaceController.populateEditForm(Model uiModel, Place place) {
        uiModel.addAttribute("place", place);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
    }
    
    String PlaceController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web.admin;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import cz.kolomet.domain.Place;
import cz.kolomet.service.PlaceService;

privileged aspect PlaceController_Roo_Controller {
    
    @Autowired
    PlaceService PlaceController.placeService;
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PlaceController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Place());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (placeTypeService.countAllPlaceTypes() == 0) {
            dependencies.add(new String[] { "placetype", "admin/placetypes" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "admin/places/create";
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

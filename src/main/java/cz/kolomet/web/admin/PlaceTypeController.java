package cz.kolomet.web.admin;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import cz.kolomet.domain.PlaceTypeColor;
import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.dto.EnumDto;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.PlaceTypeService;

@RequestMapping("/admin/placetypes")
@Controller
public class PlaceTypeController extends AbstractAdminController {
	
	@Autowired
	private ApplicationUserService applicationUserService;
	
	@RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<PlaceType> page = placeTypeService.findPlaceTypeEntries(pageable);
            uiModel.addAttribute("placetypes", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("placetypes", placeTypeService.findAllPlaceTypes());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/placetypes/list";
    }
	
	void populateEditForm(Model uiModel, PlaceType placeType) {
        uiModel.addAttribute("placeType", placeType);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("placetypecolors", EnumDto.createCollection(PlaceTypeColor.values(), messageSource));
    }
	

	@Autowired
    PlaceTypeService placeTypeService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid PlaceType placeType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, placeType);
            return "admin/placetypes/create";
        }
        uiModel.asMap().clear();
        placeTypeService.savePlaceType(placeType);
        return "redirect:/admin/placetypes/" + encodeUrlPathSegment(placeType.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new PlaceType());
        return "admin/placetypes/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("placetype", placeTypeService.findPlaceType(id));
        uiModel.addAttribute("itemId", id);
        return "admin/placetypes/show";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid PlaceType placeType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, placeType);
            return "admin/placetypes/update";
        }
        uiModel.asMap().clear();
        placeTypeService.updatePlaceType(placeType);
        return "redirect:/admin/placetypes/" + encodeUrlPathSegment(placeType.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, placeTypeService.findPlaceType(id));
        return "admin/placetypes/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PlaceType placeType = placeTypeService.findPlaceType(id);
        placeTypeService.deletePlaceType(placeType);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/placetypes";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("placeType_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("placeType_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
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

package cz.kolomet.web;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.codelist.PlaceType;

@RequestMapping("/admin/placetypes")
@Controller
@RooWebScaffold(path = "admin/placetypes", formBackingObject = PlaceType.class)
public class PlaceTypeController {
	
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
	
}

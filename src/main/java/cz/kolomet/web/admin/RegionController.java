package cz.kolomet.web.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.codelist.Region;

@RequestMapping("/admin/regions")
@Controller
@RooWebScaffold(path = "admin/regions", formBackingObject = Region.class)
public class RegionController extends AbstractAdminController {
	
	@RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<Region> page = regionService.findRegionEntries(pageable);
            uiModel.addAttribute("regions", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("regions", regionService.findAllRegions());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/regions/list";
    }
	
}

package cz.kolomet.web;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.codelist.BicycleSize;
import cz.kolomet.web.admin.AbstractAdminController;

@RequestMapping("/admin/bicyclesizes")
@Controller
@RooWebScaffold(path = "admin/bicyclesizes", formBackingObject = BicycleSize.class)
public class BicycleSizeController extends AbstractAdminController {
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<BicycleSize> page = bicycleSizeService.findBicycleSizeEntries(pageable);
            uiModel.addAttribute("bicyclesizes", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("bicyclesizes", bicycleSizeService.findAllBicycleSizes());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/bicyclesizes/list";
    }
	
}

package cz.kolomet.web;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.web.admin.AbstractAdminController;

@RequestMapping("/admin/bicyclecategories")
@Controller
@RooWebScaffold(path = "admin/bicyclecategories", formBackingObject = BicycleCategory.class)
public class BicycleCategoryController extends AbstractAdminController {
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<BicycleCategory> page = bicycleCategoryService.findBicycleCategoryEntries(pageable);
            uiModel.addAttribute("bicyclecategories", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("bicyclecategories", bicycleCategoryService.findAllBicycleCategorys());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/bicyclecategories/list";
    }
	
}

package cz.kolomet.web.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.codelist.CategoryType;

@RequestMapping("/admin/categorytypes")
@Controller
@RooWebScaffold(path = "admin/categorytypes", formBackingObject = CategoryType.class)
public class CategoryTypeController extends AbstractAdminController {
	
	@RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<CategoryType> page = categoryTypeService.findCategoryTypeEntries(pageable);
            uiModel.addAttribute("categorytypes", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("categorytypes", categoryTypeService.findAllCategoryTypes());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/categorytypes/list";
    }
	
}

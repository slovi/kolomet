package cz.kolomet.web.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.Category;

@RequestMapping("/admin/categorys")
@Controller
@RooWebScaffold(path = "admin/categorys", formBackingObject = Category.class)
public class CategoryController extends AbstractAdminController {
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<Category> page = categoryService.findCategoryEntries(pageable);
            uiModel.addAttribute("categorys", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("categorys", categoryService.findAllCategorys());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/categorys/list";
    }
	
}

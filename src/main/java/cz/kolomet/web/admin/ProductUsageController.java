package cz.kolomet.web.admin;

import cz.kolomet.domain.codelist.ProductUsage;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/productusages")
@Controller
@RooWebScaffold(path = "admin/productusages", formBackingObject = ProductUsage.class)
public class ProductUsageController {
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<ProductUsage> page = productUsageService.findProductUsageEntries(pageable); 
            uiModel.addAttribute("productusages", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("productusages", productUsageService.findAllProductUsages());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/productusages/list";
    }
	
}

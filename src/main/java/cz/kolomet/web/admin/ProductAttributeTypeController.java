package cz.kolomet.web.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.codelist.ProductAttributeType;

@RequestMapping("/admin/productattributetypes")
@Controller
@RooWebScaffold(path = "admin/productattributetypes", formBackingObject = ProductAttributeType.class)
public class ProductAttributeTypeController extends AbstractAdminController {
	
	@RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<ProductAttributeType> page = productAttributeTypeService.findProductAttributeTypeEntries(pageable);
            uiModel.addAttribute("productattributetypes", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("productattributetypes", productAttributeTypeService.findAllProductAttributeTypes());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/productattributetypes/list";
    }
	
}

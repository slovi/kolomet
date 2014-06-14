package cz.kolomet.web;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.codelist.ProductColor;
import cz.kolomet.web.admin.AbstractAdminController;

@RequestMapping("/admin/productcolors")
@Controller
@RooWebScaffold(path = "admin/productcolors", formBackingObject = ProductColor.class)
public class ProductColorController extends AbstractAdminController {

	@RequestMapping(produces = "text/html")
	public String list(Pageable pageable, Model uiModel) {
		if (pageable != null) {
			Page<ProductColor> page = productColorService.findProductColorEntries(pageable);
			uiModel.addAttribute("productcolors", page.getContent());
			uiModel.addAttribute("maxPages", page.getTotalPages());
		} else {
			uiModel.addAttribute("productcolors", productColorService.findAllProductColors());
		}
		addDateTimeFormatPatterns(uiModel);
		return "admin/productcolors/list";
	}

}

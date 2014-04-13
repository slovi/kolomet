package cz.kolomet.web.admin;

import cz.kolomet.domain.codelist.ProductUsage;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/productusages")
@Controller
@RooWebScaffold(path = "admin/productusages", formBackingObject = ProductUsage.class)
public class ProductUsageController {
}

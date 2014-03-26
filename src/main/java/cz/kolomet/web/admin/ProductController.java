package cz.kolomet.web.admin;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.Product;

@RequestMapping("/products")
@Controller
@RooWebScaffold(path = "products", formBackingObject = Product.class)
public class ProductController extends AbstractAdminController {
	
	
	
}

package cz.kolomet.web.admin;
import cz.kolomet.domain.ProductAttribute;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/productattributes")
@Controller
@RooWebScaffold(path = "productattributes", formBackingObject = ProductAttribute.class)
public class ProductAttributeController extends AbstractAdminController {
}

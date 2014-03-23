package cz.kolomet.web.admin;

import cz.kolomet.domain.codelist.ProductAttributeType;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/productattributetypes")
@Controller
@RooWebScaffold(path = "productattributetypes", formBackingObject = ProductAttributeType.class)
public class ProductAttributeTypeController extends AbstractAdminController {
}

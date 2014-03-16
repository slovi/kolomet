package cz.kolomet.web;

import cz.kolomet.domain.codelist.Category;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/categories")
@Controller
@RooWebScaffold(path = "categories", formBackingObject = Category.class)
public class CategoryController {
}

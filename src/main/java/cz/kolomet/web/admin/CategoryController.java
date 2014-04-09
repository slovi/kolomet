package cz.kolomet.web.admin;

import cz.kolomet.domain.Category;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/categorys")
@Controller
@RooWebScaffold(path = "admin/categorys", formBackingObject = Category.class)
public class CategoryController extends AbstractAdminController {
}

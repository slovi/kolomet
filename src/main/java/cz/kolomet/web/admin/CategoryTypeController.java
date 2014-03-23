package cz.kolomet.web.admin;

import cz.kolomet.domain.codelist.CategoryType;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/categorytypes")
@Controller
@RooWebScaffold(path = "categorytypes", formBackingObject = CategoryType.class)
public class CategoryTypeController extends AbstractAdminController {
}

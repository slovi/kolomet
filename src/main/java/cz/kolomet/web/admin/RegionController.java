package cz.kolomet.web.admin;

import cz.kolomet.domain.codelist.Region;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/regions")
@Controller
@RooWebScaffold(path = "admin/regions", formBackingObject = Region.class)
public class RegionController extends AbstractAdminController {
}

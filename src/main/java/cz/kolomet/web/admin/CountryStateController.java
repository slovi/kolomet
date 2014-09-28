package cz.kolomet.web.admin;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.codelist.CountryState;

@RequestMapping("/admin/countrystates")
@Controller
@RooWebScaffold(path = "admin/countrystates", formBackingObject = CountryState.class)
public class CountryStateController extends AbstractAdminController {
}

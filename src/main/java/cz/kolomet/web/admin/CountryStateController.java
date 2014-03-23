package cz.kolomet.web.admin;

import cz.kolomet.domain.codelist.CountryState;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/countrystates")
@Controller
@RooWebScaffold(path = "countrystates", formBackingObject = CountryState.class)
public class CountryStateController extends AbstractAdminController {
}

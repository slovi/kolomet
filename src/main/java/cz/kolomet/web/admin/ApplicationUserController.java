package cz.kolomet.web.admin;

import cz.kolomet.domain.ApplicationUser;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/applicationusers")
@Controller
@RooWebScaffold(path = "applicationusers", formBackingObject = ApplicationUser.class)
public class ApplicationUserController extends AbstractAdminController {
}

package cz.kolomet.web.admin;

import cz.kolomet.domain.ApplicationRole;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/applicationroles")
@Controller
@RooWebScaffold(path = "applicationroles", formBackingObject = ApplicationRole.class)
public class ApplicationRoleController extends AbstractAdminController {
}
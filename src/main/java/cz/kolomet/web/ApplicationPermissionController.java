package cz.kolomet.web;

import cz.kolomet.domain.ApplicationPermission;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/applicationpermissions")
@Controller
@RooWebScaffold(path = "applicationpermissions", formBackingObject = ApplicationPermission.class)
public class ApplicationPermissionController {
}
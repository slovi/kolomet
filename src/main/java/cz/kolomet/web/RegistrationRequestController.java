package cz.kolomet.web;

import cz.kolomet.domain.RegistrationRequest;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/registrationrequests")
@Controller
@RooWebScaffold(path = "admin/registrationrequests", formBackingObject = RegistrationRequest.class)
public class RegistrationRequestController {
}

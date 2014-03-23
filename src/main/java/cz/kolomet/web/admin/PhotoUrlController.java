package cz.kolomet.web.admin;
import cz.kolomet.domain.PhotoUrl;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/photourls")
@Controller
@RooWebScaffold(path = "photourls", formBackingObject = PhotoUrl.class)
public class PhotoUrlController extends AbstractAdminController {
}

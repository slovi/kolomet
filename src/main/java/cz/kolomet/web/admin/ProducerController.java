package cz.kolomet.web.admin;
import cz.kolomet.domain.Producer;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/producers")
@Controller
@RooWebScaffold(path = "admin/producers", formBackingObject = Producer.class)
public class ProducerController extends AbstractAdminController {
}

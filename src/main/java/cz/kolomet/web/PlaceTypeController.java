package cz.kolomet.web;
import cz.kolomet.domain.codelist.PlaceType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/placetypes")
@Controller
@RooWebScaffold(path = "admin/placetypes", formBackingObject = PlaceType.class)
public class PlaceTypeController {
}

package cz.kolomet.web.admin;

import cz.kolomet.domain.Place;
import cz.kolomet.web.pub.AbstractPublicController;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/places")
@Controller("adminPlaceController")
@RooWebScaffold(path = "admin/places", formBackingObject = Place.class)
public class PlaceController extends AbstractPublicController {
}

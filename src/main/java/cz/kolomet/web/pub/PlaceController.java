package cz.kolomet.web.pub;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.Place;

@RequestMapping("/public/places")
@Controller("publicPlaceController")
@RooWebScaffold(path = "public/places", formBackingObject = Place.class, create = false, delete = false, update = false)
public class PlaceController extends AbstractPublicController {
	
}

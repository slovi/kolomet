package cz.kolomet.web;
import cz.kolomet.domain.PlacePhotoUrl;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/placephotourls")
@Controller
@RooWebScaffold(path = "admin/placephotourls", formBackingObject = PlacePhotoUrl.class, update = false, create = false)
public class PlacePhotoUrlController {
}

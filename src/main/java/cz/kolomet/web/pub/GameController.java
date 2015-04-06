package cz.kolomet.web.pub;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/public/game/**")
@Controller
public class GameController extends AbstractPublicController {
	
    @RequestMapping
    public String index(Model model) {
    	model.addAttribute("newsBanners", newsItemService.findPlaceNewsBanners(getNewsItemsPageRequest()));
        return "public/game/index";
    }

}
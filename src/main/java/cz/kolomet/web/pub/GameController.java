package cz.kolomet.web.pub;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.Page;
import cz.kolomet.service.PageService;


@RequestMapping("/public/game/**")
@Controller
public class GameController extends AbstractPublicController {
	
	@Autowired
	private PageService pageService;
	
    @RequestMapping
    public String index(Model model) {
    	
    	Page page = pageService.findPageByName("game");

    	model.addAttribute("newsBanners", newsItemService.findPlaceNewsBanners(getNewsItemsPageRequest()));
    	model.addAttribute("page", page);
        return "public/game/index";
    }

}
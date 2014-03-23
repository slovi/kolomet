package cz.kolomet.web.admin;

import cz.kolomet.domain.NewsItem;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/newsitems")
@Controller
@RooWebScaffold(path = "newsitems", formBackingObject = NewsItem.class)
public class NewsItemController extends AbstractAdminController {
}

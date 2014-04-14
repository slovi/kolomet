package cz.kolomet.web.admin;

import cz.kolomet.domain.NewsItem;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/newsitems")
@Controller
@RooWebScaffold(path = "admin/newsitems", formBackingObject = NewsItem.class)
public class NewsItemController extends AbstractAdminController {
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<NewsItem> page = newsItemService.findNewsItemEntries(pageable);
            uiModel.addAttribute("newsitems", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("newsitems", newsItemService.findAllNewsItems());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/newsitems/list";
    }
	
}

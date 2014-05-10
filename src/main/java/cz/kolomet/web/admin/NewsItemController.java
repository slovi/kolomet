package cz.kolomet.web.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.NewsItemService;

@RequestMapping("/admin/newsitems")
@Controller
@RooWebScaffold(path = "admin/newsitems", formBackingObject = NewsItem.class)
public class NewsItemController extends AbstractAdminController {
	
	@Autowired
	private NewsItemService newsItemService;
	
	@Autowired
	private ApplicationUserService applicationUserService;
	
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid NewsItem newsItem, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) throws IOException {
        
    	if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, newsItem);
            return "admin/newsitems/create";
        }
        
    	uiModel.asMap().clear();              

    	newsItemService.saveNewsItem(newsItem);
    	saveNewsItemPhotos(newsItem, newsItem.getContents());
    	
        return "redirect:/admin/newsitems/" + newsItem.getId().toString();
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid NewsItem newsItem, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, newsItem);
            return "admin/newsitem/update";
        }
        uiModel.asMap().clear();        
        
        newsItemService.updateNewsItem(newsItem);
        return "redirect:/admin/newsitems/" + newsItem.getId();
    }
	
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
    
    void populateEditForm(Model uiModel, NewsItem newsItem) {
        uiModel.addAttribute("newsItem", newsItem);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("newsitemphotourls", newsItemPhotoUrlService.findAllNewsItemPhotoUrls());
    }
    
    void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("newsItem_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("newsItem_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("newsItem_newsitemdate_date_format", DateTimeFormat.patternForStyle("MS", LocaleContextHolder.getLocale()));
    }
	
}

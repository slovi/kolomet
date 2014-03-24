// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web.admin;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.NewsItemService;
import cz.kolomet.web.admin.NewsItemController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect NewsItemController_Roo_Controller {
    
    @Autowired
    NewsItemService NewsItemController.newsItemService;
    
    @Autowired
    ApplicationUserService NewsItemController.applicationUserService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String NewsItemController.create(@Valid NewsItem newsItem, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, newsItem);
            return "newsitems/create";
        }
        uiModel.asMap().clear();
        newsItemService.saveNewsItem(newsItem);
        return "redirect:/newsitems/" + encodeUrlPathSegment(newsItem.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String NewsItemController.createForm(Model uiModel) {
        populateEditForm(uiModel, new NewsItem());
        return "newsitems/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String NewsItemController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("newsitem", newsItemService.findNewsItem(id));
        uiModel.addAttribute("itemId", id);
        return "newsitems/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String NewsItemController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("newsitems", newsItemService.findNewsItemEntries(firstResult, sizeNo));
            float nrOfPages = (float) newsItemService.countAllNewsItems() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("newsitems", newsItemService.findAllNewsItems());
        }
        addDateTimeFormatPatterns(uiModel);
        return "newsitems/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String NewsItemController.update(@Valid NewsItem newsItem, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, newsItem);
            return "newsitems/update";
        }
        uiModel.asMap().clear();
        newsItemService.updateNewsItem(newsItem);
        return "redirect:/newsitems/" + encodeUrlPathSegment(newsItem.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String NewsItemController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, newsItemService.findNewsItem(id));
        return "newsitems/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String NewsItemController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        NewsItem newsItem = newsItemService.findNewsItem(id);
        newsItemService.deleteNewsItem(newsItem);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/newsitems";
    }
    
    void NewsItemController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("newsItem_newsitemdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void NewsItemController.populateEditForm(Model uiModel, NewsItem newsItem) {
        uiModel.addAttribute("newsItem", newsItem);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
    }
    
    String NewsItemController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
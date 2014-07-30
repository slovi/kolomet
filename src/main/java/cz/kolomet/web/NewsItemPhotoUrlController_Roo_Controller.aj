// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web;

import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.web.NewsItemPhotoUrlController;
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

privileged aspect NewsItemPhotoUrlController_Roo_Controller {
    
    @Autowired
    ApplicationUserService NewsItemPhotoUrlController.applicationUserService;
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String NewsItemPhotoUrlController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("newsitemphotourl", newsItemPhotoUrlService.findNewsItemPhotoUrl(id));
        uiModel.addAttribute("itemId", id);
        return "admin/newsitemphotourls/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String NewsItemPhotoUrlController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("newsitemphotourls", newsItemPhotoUrlService.findNewsItemPhotoUrlEntries(firstResult, sizeNo));
            float nrOfPages = (float) newsItemPhotoUrlService.countAllNewsItemPhotoUrls() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("newsitemphotourls", newsItemPhotoUrlService.findAllNewsItemPhotoUrls());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/newsitemphotourls/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String NewsItemPhotoUrlController.update(@Valid NewsItemPhotoUrl newsItemPhotoUrl, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, newsItemPhotoUrl);
            return "admin/newsitemphotourls/update";
        }
        uiModel.asMap().clear();
        newsItemPhotoUrlService.updateNewsItemPhotoUrl(newsItemPhotoUrl);
        return "redirect:/admin/newsitemphotourls/" + encodeUrlPathSegment(newsItemPhotoUrl.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String NewsItemPhotoUrlController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, newsItemPhotoUrlService.findNewsItemPhotoUrl(id));
        return "admin/newsitemphotourls/update";
    }
    
    void NewsItemPhotoUrlController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("newsItemPhotoUrl_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("newsItemPhotoUrl_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void NewsItemPhotoUrlController.populateEditForm(Model uiModel, NewsItemPhotoUrl newsItemPhotoUrl) {
        uiModel.addAttribute("newsItemPhotoUrl", newsItemPhotoUrl);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("newsitems", newsItemService.findAllNewsItems());
    }
    
    String NewsItemPhotoUrlController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
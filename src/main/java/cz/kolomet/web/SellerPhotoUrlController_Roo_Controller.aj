// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web;

import cz.kolomet.domain.SellerPhotoUrl;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.SellerPhotoUrlService;
import cz.kolomet.web.SellerPhotoUrlController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect SellerPhotoUrlController_Roo_Controller {
    
    @Autowired
    SellerPhotoUrlService SellerPhotoUrlController.sellerPhotoUrlService;
    
    @Autowired
    ApplicationUserService SellerPhotoUrlController.applicationUserService;
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SellerPhotoUrlController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("sellerphotourl", sellerPhotoUrlService.findSellerPhotoUrl(id));
        uiModel.addAttribute("itemId", id);
        return "sellerphotourls/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SellerPhotoUrlController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("sellerphotourls", sellerPhotoUrlService.findSellerPhotoUrlEntries(firstResult, sizeNo));
            float nrOfPages = (float) sellerPhotoUrlService.countAllSellerPhotoUrls() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("sellerphotourls", sellerPhotoUrlService.findAllSellerPhotoUrls());
        }
        addDateTimeFormatPatterns(uiModel);
        return "sellerphotourls/list";
    }
    
    void SellerPhotoUrlController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("sellerPhotoUrl_created_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("sellerPhotoUrl_lastmodified_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void SellerPhotoUrlController.populateEditForm(Model uiModel, SellerPhotoUrl sellerPhotoUrl) {
        uiModel.addAttribute("sellerPhotoUrl", sellerPhotoUrl);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("sellers", sellerService.findAllSellers());
    }
    
    String SellerPhotoUrlController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

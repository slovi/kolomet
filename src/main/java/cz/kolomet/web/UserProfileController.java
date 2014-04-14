package cz.kolomet.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.domain.Seller;
import cz.kolomet.security.ApplicationUserDetails;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.CountryStateService;
import cz.kolomet.service.ProductService;
import cz.kolomet.service.RegionService;
import cz.kolomet.service.SellerPhotoUrlService;
import cz.kolomet.service.SellerService;
import cz.kolomet.service.SellerStatusService;

@RequestMapping("/private/userprofile/**")
@Controller
public class UserProfileController {
	
    @Autowired
    SellerService sellerService;
    
    @Autowired
    ApplicationUserService applicationUserService;
    
    @Autowired
    ProductService productService;
    
    @Autowired
    SellerPhotoUrlService sellerPhotoUrlService;
    
    @Autowired
    CountryStateService countryStateService;
    
    @Autowired
    RegionService regionService;
    
    @Autowired
    SellerStatusService sellerStatusService;

    @RequestMapping(method = RequestMethod.POST, value = "{id}")
    public void post(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String updateForm(Model uiModel) {
        populateEditForm(uiModel, sellerService.findSeller(ApplicationUserDetails.getActualApplicationUserDetails().getSellerId()));
        return "private/userprofile/update";
    }
    
    void populateEditForm(Model uiModel, Seller seller) {
        uiModel.addAttribute("seller", seller);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("products", productService.findAllProducts());
        uiModel.addAttribute("sellerphotourls", sellerPhotoUrlService.findAllSellerPhotoUrls());
        uiModel.addAttribute("countrystates", countryStateService.findAllCountryStates());
        uiModel.addAttribute("regions", regionService.findAllRegions());
        uiModel.addAttribute("sellerstatuses", sellerStatusService.findAllSellerStatuses());
    }
    
    void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("seller_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("seller_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
}

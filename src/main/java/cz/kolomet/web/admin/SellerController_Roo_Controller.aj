// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web.admin;

import cz.kolomet.domain.Seller;
import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.domain.codelist.SellerStatus;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.CountryStateService;
import cz.kolomet.service.ProductService;
import cz.kolomet.service.RegionService;
import cz.kolomet.service.SellerPhotoUrlService;
import cz.kolomet.service.SellerService;
import cz.kolomet.service.SellerStatusService;
import cz.kolomet.web.admin.SellerController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
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

privileged aspect SellerController_Roo_Controller {
    
    @Autowired
    SellerService SellerController.sellerService;
    
    @Autowired
    ApplicationUserService SellerController.applicationUserService;
    
    @Autowired
    ProductService SellerController.productService;
    
    @Autowired
    SellerPhotoUrlService SellerController.sellerPhotoUrlService;
    
    @Autowired
    CountryStateService SellerController.countryStateService;
    
    @Autowired
    RegionService SellerController.regionService;
    
    @Autowired
    SellerStatusService SellerController.sellerStatusService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SellerController.create(@Valid Seller seller, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, seller);
            return "admin/sellers/create";
        }
        uiModel.asMap().clear();
        sellerService.saveSeller(seller);
        return "redirect:/admin/sellers/" + encodeUrlPathSegment(seller.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SellerController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Seller());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (countryStateService.countAllCountryStates() == 0) {
            dependencies.add(new String[] { "countrystate", "countrystates" });
        }
        if (sellerStatusService.countAllSellerStatuses() == 0) {
            dependencies.add(new String[] { "sellerstatus", "sellerstatuses" });
        }
        if (regionService.countAllRegions() == 0) {
            dependencies.add(new String[] { "region", "regions" });
        }
        if (countryStateService.countAllCountryStates() == 0) {
            dependencies.add(new String[] { "countrystate", "countrystates" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "admin/sellers/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SellerController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("seller", sellerService.findSeller(id));
        uiModel.addAttribute("itemId", id);
        return "admin/sellers/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SellerController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("sellers", sellerService.findSellerEntries(firstResult, sizeNo));
            float nrOfPages = (float) sellerService.countAllSellers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("sellers", sellerService.findAllSellers());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/sellers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SellerController.update(@Valid Seller seller, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, seller);
            return "admin/sellers/update";
        }
        uiModel.asMap().clear();
        sellerService.updateSeller(seller);
        return "redirect:/admin/sellers/" + encodeUrlPathSegment(seller.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SellerController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, sellerService.findSeller(id));
        return "admin/sellers/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SellerController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Seller seller = sellerService.findSeller(id);
        sellerService.deleteSeller(seller);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/sellers";
    }
    
    void SellerController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("seller_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("seller_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void SellerController.populateEditForm(Model uiModel, Seller seller) {
        uiModel.addAttribute("seller", seller);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("products", productService.findAllProducts());
        uiModel.addAttribute("sellerphotourls", sellerPhotoUrlService.findAllSellerPhotoUrls());
        uiModel.addAttribute("countrystates", countryStateService.findAllCountryStates());
        uiModel.addAttribute("regions", regionService.findAllRegions());
        uiModel.addAttribute("sellerstatuses", sellerStatusService.findAllSellerStatuses());
    }
    
    String SellerController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

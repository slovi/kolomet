// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web.admin;

import cz.kolomet.domain.ProductAttribute;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.ProductAttributeService;
import cz.kolomet.web.admin.ProductAttributeController;
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

privileged aspect ProductAttributeController_Roo_Controller {
    
    @Autowired
    ProductAttributeService ProductAttributeController.productAttributeService;
    
    @Autowired
    ApplicationUserService ProductAttributeController.applicationUserService;
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProductAttributeController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("productattribute", productAttributeService.findProductAttribute(id));
        uiModel.addAttribute("itemId", id);
        return "admin/productattributes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProductAttributeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("productattributes", productAttributeService.findProductAttributeEntries(firstResult, sizeNo));
            float nrOfPages = (float) productAttributeService.countAllProductAttributes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("productattributes", productAttributeService.findAllProductAttributes());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/productattributes/list";
    }
    
    void ProductAttributeController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("productAttribute_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("productAttribute_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void ProductAttributeController.populateEditForm(Model uiModel, ProductAttribute productAttribute) {
        uiModel.addAttribute("productAttribute", productAttribute);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("products", productService.findAllProducts());
        uiModel.addAttribute("productattributetypes", productAttributeTypeService.findAllProductAttributeTypes());
    }
    
    String ProductAttributeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web.admin;

import cz.kolomet.domain.Product;
import cz.kolomet.service.ProductService;
import cz.kolomet.web.admin.ProductController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ProductController_Roo_Controller {
    
    @Autowired
    ProductService ProductController.productService;
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProductController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Product());
        return "admin/products/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProductController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("product", productService.findProduct(id));
        uiModel.addAttribute("itemId", id);
        return "admin/products/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProductController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("products", productService.findProductEntries(firstResult, sizeNo));
            float nrOfPages = (float) productService.countAllProducts() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("products", productService.findAllProducts());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/products/list";
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProductController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, productService.findProduct(id));
        return "admin/products/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProductController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Product product = productService.findProduct(id);
        productService.deleteProduct(product);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/products";
    }
    
    void ProductController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("product_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("product_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("product_validto_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String ProductController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

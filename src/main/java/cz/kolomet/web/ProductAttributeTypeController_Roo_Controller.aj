// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web;

import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.service.ProductAttributeTypeService;
import cz.kolomet.web.ProductAttributeTypeController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ProductAttributeTypeController_Roo_Controller {
    
    @Autowired
    ProductAttributeTypeService ProductAttributeTypeController.productAttributeTypeService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProductAttributeTypeController.create(@Valid ProductAttributeType productAttributeType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, productAttributeType);
            return "productattributetypes/create";
        }
        uiModel.asMap().clear();
        productAttributeTypeService.saveProductAttributeType(productAttributeType);
        return "redirect:/productattributetypes/" + encodeUrlPathSegment(productAttributeType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProductAttributeTypeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ProductAttributeType());
        return "productattributetypes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProductAttributeTypeController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("productattributetype", productAttributeTypeService.findProductAttributeType(id));
        uiModel.addAttribute("itemId", id);
        return "productattributetypes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProductAttributeTypeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("productattributetypes", productAttributeTypeService.findProductAttributeTypeEntries(firstResult, sizeNo));
            float nrOfPages = (float) productAttributeTypeService.countAllProductAttributeTypes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("productattributetypes", productAttributeTypeService.findAllProductAttributeTypes());
        }
        return "productattributetypes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProductAttributeTypeController.update(@Valid ProductAttributeType productAttributeType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, productAttributeType);
            return "productattributetypes/update";
        }
        uiModel.asMap().clear();
        productAttributeTypeService.updateProductAttributeType(productAttributeType);
        return "redirect:/productattributetypes/" + encodeUrlPathSegment(productAttributeType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProductAttributeTypeController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, productAttributeTypeService.findProductAttributeType(id));
        return "productattributetypes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProductAttributeTypeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ProductAttributeType productAttributeType = productAttributeTypeService.findProductAttributeType(id);
        productAttributeTypeService.deleteProductAttributeType(productAttributeType);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/productattributetypes";
    }
    
    void ProductAttributeTypeController.populateEditForm(Model uiModel, ProductAttributeType productAttributeType) {
        uiModel.addAttribute("productAttributeType", productAttributeType);
    }
    
    String ProductAttributeTypeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

package cz.kolomet.web.admin;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import cz.kolomet.domain.Product;
import cz.kolomet.domain.ProductAttribute;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.ProductAttributeService;
import cz.kolomet.service.ProductAttributeTypeService;
import cz.kolomet.service.ProductService;

@RequestMapping("/admin/productattributes")
@Controller
public class ProductAttributeController extends AbstractAdminController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductAttributeTypeService productAttributeTypeService;
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, @RequestParam(value = "parentEntityId", required = false) Long parentEntityId, @RequestParam(value = "source", required = false) String source) {
    	Product product = parentEntityId != null ? productService.findProduct(parentEntityId) : null;
        populateEditForm(uiModel, new ProductAttribute(), product);
        uiModel.addAttribute("source", source);
        List<String[]> dependencies = new ArrayList<String[]>();
        if (productAttributeTypeService.countAllProductAttributeTypes() == 0) {
            dependencies.add(new String[] { "productattributetype", "productattributetypes" });
        }
        if (productService.countAllProducts() == 0) {
            dependencies.add(new String[] { "product", "products" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "admin/productattributes/create";
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
    	ProductAttribute productAttribute = productAttributeService.findProductAttribute(id); 
        populateEditForm(uiModel, productAttribute, null);
        return "admin/productattributes/update";
    }
	
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid ProductAttribute productAttribute, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, productAttribute, null);
            return "admin/productattributes/create";
        }
        uiModel.asMap().clear();
        productAttributeService.saveProductAttribute(productAttribute);
        return "redirect:/admin/products/" + productAttribute.getProduct().getId() + "?form";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid ProductAttribute productAttribute, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, productAttribute, null);
            return "admin/productattributes/update";
        }
        uiModel.asMap().clear();
        productAttributeService.updateProductAttribute(productAttribute);
        return "redirect:/admin/products/" + productAttribute.getProduct().getId() + "?form";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, Pageable pageable, Boolean updateMode, Model uiModel) {
        ProductAttribute productAttribute = productAttributeService.findProductAttribute(id);
        productAttributeService.deleteProductAttribute(productAttribute);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", pageable.getPageNumber());
        uiModel.addAttribute("size", pageable.getPageSize());
       	return "redirect:/admin/products/" + productAttribute.getProduct().getId() + "?form";
    }
    
    void populateEditForm(Model uiModel, ProductAttribute productAttribute, Product product) {
        uiModel.addAttribute("productAttribute", productAttribute);
        if (product != null) {
        	productAttribute.setProduct(product);
        }
        uiModel.addAttribute("products", productService.findAllProducts());
        uiModel.addAttribute("productattributetypes", productAttributeTypeService.findAllProductAttributeTypes());
    }
	

	@Autowired
    ProductAttributeService productAttributeService;

	@Autowired
    ApplicationUserService applicationUserService;

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("productattribute", productAttributeService.findProductAttribute(id));
        uiModel.addAttribute("itemId", id);
        return "admin/productattributes/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
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

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("productAttribute_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("productAttribute_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, ProductAttribute productAttribute) {
        uiModel.addAttribute("productAttribute", productAttribute);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("products", productService.findAllProducts());
        uiModel.addAttribute("productattributetypes", productAttributeTypeService.findAllProductAttributeTypes());
    }

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

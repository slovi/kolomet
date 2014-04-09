package cz.kolomet.web.admin;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cz.kolomet.domain.Product;
import cz.kolomet.domain.ProductAttribute;
import cz.kolomet.service.ProductAttributeTypeService;
import cz.kolomet.service.ProductService;
import cz.kolomet.util.db.OrmUtils;

@RequestMapping("/admin/productattributes")
@Controller
@RooWebScaffold(path = "productattributes", formBackingObject = ProductAttribute.class)
public class ProductAttributeController extends AbstractAdminController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductAttributeTypeService productAttributeTypeService;
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, @RequestParam(value = "parentEntityId", required = false) Long parentEntityId) {
    	Product product = parentEntityId != null ? productService.findProduct(parentEntityId) : null;
        populateEditForm(uiModel, new ProductAttribute(), product);
        List<String[]> dependencies = new ArrayList<String[]>();
        if (productAttributeTypeService.countAllProductAttributeTypes() == 0) {
            dependencies.add(new String[] { "productattributetype", "productattributetypes" });
        }
        if (productService.countAllProducts() == 0) {
            dependencies.add(new String[] { "product", "products" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "productattributes/create";
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
    	ProductAttribute productAttribute = productAttributeService.findProductAttribute(id); 
    	productAttribute.setProduct(OrmUtils.deproxy(productAttribute.getProduct())); // TODO vyresit cistsim zpusobem
        populateEditForm(uiModel, productAttribute, null);
        return "productattributes/update";
    }
	
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid ProductAttribute productAttribute, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, productAttribute, null);
            return "productattributes/create";
        }
        uiModel.asMap().clear();
        productAttributeService.saveProductAttribute(productAttribute);
        return "redirect:/admin/products/" + encodeUrlPathSegment(productAttribute.getProduct().getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid ProductAttribute productAttribute, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, productAttribute, null);
            return "productattributes/update";
        }
        uiModel.asMap().clear();
        productAttributeService.updateProductAttribute(productAttribute);
        return "redirect:/admin/products/" + encodeUrlPathSegment(productAttribute.getProduct().getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ProductAttribute productAttribute = productAttributeService.findProductAttribute(id);
        productAttributeService.deleteProductAttribute(productAttribute);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/products/" + productAttribute.getProduct().getId();
    }
    
    void populateEditForm(Model uiModel, ProductAttribute productAttribute, Product product) {
        uiModel.addAttribute("productAttribute", productAttribute);
        if (product != null) {
        	productAttribute.setProduct(product);
        }
        uiModel.addAttribute("products", productService.findAllProducts());
        uiModel.addAttribute("productattributetypes", productAttributeTypeService.findAllProductAttributeTypes());
    }
	
}

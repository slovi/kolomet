package cz.kolomet.web.admin;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.ProductAttribute;
import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.CategoryService;
import cz.kolomet.service.PhotoUrlService;
import cz.kolomet.service.ProducerService;
import cz.kolomet.service.ProductAttributeService;
import cz.kolomet.service.ProductAttributeTypeService;
import cz.kolomet.service.SellerService;

@RequestMapping("/products")
@Controller
@RooWebScaffold(path = "products", formBackingObject = Product.class)
public class ProductController extends AbstractAdminController {
	
    @Autowired
    ApplicationUserService applicationUserService;
    
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    ProducerService producerService;
    
    @Autowired
    ProductAttributeService productAttributeService;
    
    @Autowired
    ProductAttributeTypeService productAttributeTypeService;
    
    @Autowired
    SellerService sellerService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Product product, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) throws IOException {
        
    	if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, product);
            return "products/create";
        }
        
    	uiModel.asMap().clear();              
        for (ProductAttribute productAttribute: product.getProductAttributes()) {
        	productAttribute.setProduct(product);
        }                
        
        productService.saveProduct(product);
        
        savePhotos(product);
        
        return "redirect:/products/" + product.getId().toString();
    }
	
    void populateEditForm(Model uiModel, Product product) {
        uiModel.addAttribute("product", product);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("categorys", categoryService.findAllCategorys());
        uiModel.addAttribute("photourls", photoUrlService.findAllPhotoUrls());
        uiModel.addAttribute("producers", producerService.findAllProducers());
        uiModel.addAttribute("productattributes", productAttributeService.findAllProductAttributes());
        uiModel.addAttribute("sellers", sellerService.findAllSellers());
        
        if (product.isNew()) {
        	List<ProductAttribute> productAttributes = new ArrayList<ProductAttribute>();
        	for (ProductAttributeType type: productAttributeTypeService.findAllProductAttributeTypes()) {
        		ProductAttribute productAttribute = new ProductAttribute();
        		productAttribute.setProduct(product);
        		productAttribute.setAttributeValue("");
        		productAttribute.setAttributeType(type);
        		productAttributes.add(productAttribute);
        	}
        	product.setProductAttributes(productAttributes);        	
        }
    }
	
}

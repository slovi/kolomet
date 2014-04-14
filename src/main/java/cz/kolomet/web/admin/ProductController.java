package cz.kolomet.web.admin;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.domain.Product;
import cz.kolomet.domain.ProductAttribute;
import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.security.ApplicationUserDetails;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.BicycleSizeService;
import cz.kolomet.service.CategoryService;
import cz.kolomet.service.FigureHeightService;
import cz.kolomet.service.ProducerService;
import cz.kolomet.service.ProductAttributeService;
import cz.kolomet.service.ProductAttributeTypeService;
import cz.kolomet.service.ProductService;
import cz.kolomet.service.ProductUsageService;
import cz.kolomet.service.SellerService;

@RequestMapping("/admin/products")
@Controller
@RooWebScaffold(path = "admin/products", formBackingObject = Product.class)
public class ProductController extends AbstractAdminController {
	
	@Autowired
	ProductService productService;
	
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
    BicycleSizeService bicycleSizeService;
    
    @Autowired
    FigureHeightService figureHeightsService;
    
    @Autowired
    SellerService sellerService;
    
    @Autowired
    ProductUsageService productUsageService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Product product, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) throws IOException {
        
    	if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, product);
            return "admin/products/create";
        }
        
    	uiModel.asMap().clear();              
        for (ProductAttribute productAttribute: product.getProductAttributes()) {
        	productAttribute.setProduct(product);
        }                
        
        productService.saveProduct(product);
        
        savePhotos(product, product.getContents());
        
        return "redirect:/admin/products/" + product.getId().toString();
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Product product, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, product);
            return "admin/products/update";
        }
        uiModel.asMap().clear();
        for (ProductAttribute productAttribute: product.getProductAttributes()) {
        	productAttribute.setProduct(product);
        }
        
        productService.updateProduct(product);
        return "redirect:/admin/products/" + encodeUrlPathSegment(product.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	ApplicationUserDetails details = ApplicationUserDetails.getActualApplicationUserDetails();
        	Page<Product> page = null;
        	if (details.isProductsOwn()) {
        		page = productService.findProductEntries(pageable, ApplicationUserDetails.getActualApplicationUserDetails().getSellerId());
        	} else {
        		page = productService.findProductEntries(pageable); 
        	}
            uiModel.addAttribute("products", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("products", productService.findAllProducts());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/products/list";
    }
	
    void populateEditForm(Model uiModel, Product product) {
        uiModel.addAttribute("product", product);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("categorys", categoryService.findAllCategorys());
        uiModel.addAttribute("photourls", photoUrlService.findAllPhotoUrls());
        uiModel.addAttribute("producers", producerService.findAllProducers());
        uiModel.addAttribute("productattributes", productAttributeService.findAllProductAttributes());
        uiModel.addAttribute("productusages", productUsageService.findAllProductUsages());
        uiModel.addAttribute("figureheights", figureHeightsService.findAllFigureHeights());
        uiModel.addAttribute("bicyclesizes", bicycleSizeService.findAllBicycleSizes());
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

package cz.kolomet.web.admin;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
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
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.dto.AdminProductFilterDto;
import cz.kolomet.repository.ProductSpecifications;
import cz.kolomet.security.ApplicationUserDetails;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.BicycleCategoryService;
import cz.kolomet.service.CategoryService;
import cz.kolomet.service.FigureHeightService;
import cz.kolomet.service.PhotoUrlService;
import cz.kolomet.service.ProducerService;
import cz.kolomet.service.ProductAttributeService;
import cz.kolomet.service.ProductAttributeTypeService;
import cz.kolomet.service.ProductColorService;
import cz.kolomet.service.ProductService;
import cz.kolomet.service.ProductUsageService;
import cz.kolomet.service.SellerService;
import cz.kolomet.util.PageDto;

@RequestMapping("/admin/products")
@Controller
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
    BicycleCategoryService bicycleCategoryService;
    
    @Autowired
    FigureHeightService figureHeightsService;
    
    @Autowired
    SellerService sellerService;
    
    @Autowired
    ProductUsageService productUsageService;
    
    @Autowired
    ProductColorService productColorService;
    
    @Autowired
    PhotoUrlService photoUrlService;
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        return "redirect:public/products/detail/" + id;
    }
    
    @RequestMapping(value = "/{id}", params = "copy", produces = "text/html")
    public String copyForm(@PathVariable("id") Long id, Model uiModel, HttpServletRequest httpServletRequest) throws IOException {
    	
    	Product product = productService.copyProduct(id);
    	File targetFolder = new File(new File(rootDir, tempDir), httpServletRequest.getSession().getId());
    	FileUtils.forceMkdir(targetFolder);
    	Product copiedProduct = productService.findProduct(id);
    	product.copyAllPhotoUrlFiles(copiedProduct, getDestFolder(copiedProduct), targetFolder);
        populateEditForm(uiModel, product);
        return "admin/products/create";
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
    	
    	Product product = productService.findProduct(id);
    	populateEditForm(uiModel, product);    	
        return "admin/products/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Product product = productService.findProduct(id);
        productService.deleteProduct(product);
        return "redirect:public/products/detail/" + id;
    }
    
    @RequestMapping(value = "/{id}", params = {"erase"}, method = RequestMethod.DELETE, produces = "text/html")
    public String erase(@PathVariable("id") Long id, Model uiModel) {
        Product product = productService.findProduct(id);
        productService.eraseProduct(product);
        return "redirect:admin/products";
    }
    
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
        
        if (!getActualUserDetails().isSellersAll()) {
        	product.setSeller(getActualUser().getSeller());
        }
        
        productService.saveProduct(product);
       	saveCopied(product, photoUrlService, httpServletRequest.getSession().getId(), product.getFileInfos());
        return "redirect:public/products/detail/" + product.getId();
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Product product, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, product);
            return "admin/products/update";
        }
        
        if (!getActualUserDetails().isCapableToEditValidDates(product)) {
    		Product actualProduct = productService.findProduct(product.getId());
    		product.setValidFrom(actualProduct.getValidFrom());
    		product.setValidTo(actualProduct.getValidTo());
        }
        
        uiModel.asMap().clear();
        for (ProductAttribute productAttribute: product.getProductAttributes()) {
        	productAttribute.setProduct(product);
        }
        
        if (!getActualUserDetails().isSellersAll()) {
        	product.setSeller(getActualUser().getSeller());
        }
        
        productService.updateProduct(product);
        savePhotos(product, photoUrlService, httpServletRequest.getSession().getId(), product.getFileInfos());
        
        return "redirect:public/products/detail/" + product.getId();
    }
    
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel, AdminProductFilterDto productFilter) {
        if (pageable != null) {
        	ApplicationUserDetails details = getActualUserDetails();
        	Page<Product> page = null;
        	if (details.isProductsOwn()) {
        		Long sellerId = details.getSellerId();
        		page = productService.findProductEntries(ProductSpecifications.forAdminProductFiter(productFilter, sellerId), pageable);
        	} else {
        		page = productService.findProductEntries(ProductSpecifications.forAdminProductFiter(productFilter, null), pageable); 
        	}
        	uiModel.addAttribute("productsPage", new PageDto(page));
        	uiModel.addAttribute("products", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("products", productService.findProductEntries(ProductSpecifications.forAdminProductFiter(productFilter, null)));
        }
        uiModel.addAttribute("productFilter", productFilter);
        addDateTimeFormatPatterns(uiModel);
        return "admin/products/list";
    }
	
    void populateEditForm(Model uiModel, Product product) {

    	uiModel.addAttribute("product", product);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("categorys", categoryService.findAllCategorys());
        uiModel.addAttribute("producers", producerService.findAllProducers());
        uiModel.addAttribute("productusages", productUsageService.findAllProductUsages());
        uiModel.addAttribute("figureheights", figureHeightsService.findAllFigureHeights());
        uiModel.addAttribute("productcolors", productColorService.findAllProductColors());
        uiModel.addAttribute("bicyclecategories", bicycleCategoryService.findAllBicycleCategorys());
        
        if (getActualUserDetails().isSellersAll()) {
        	uiModel.addAttribute("sellers", sellerService.findAllEnabledSellers());
        } else {
        	uiModel.addAttribute("sellers", Arrays.asList(new Seller[] {sellerService.findSeller(getActualUserDetails().getSellerId())}));
        }

        uiModel.addAttribute("addedFiles", jsonSerializer.toJsonArray(product.getFileInfos()));
        uiModel.addAttribute("uploadedFiles", jsonSerializer.toJsonArray(product.getPhotoUrls(), new String[] {"id", "contentType", "fileName"}));

    	for (ProductAttributeType type: productAttributeTypeService.findAllProductAttributeTypes()) {
    		if (!product.containsProductAttributeType(type)) {
	    		ProductAttribute productAttribute = new ProductAttribute();
	    		productAttribute.setProduct(product);
	    		productAttribute.setAttributeValue("");
	    		productAttribute.setAttributeType(type);
	    		product.addProductAttribute(productAttribute);
    		}
    	}     	
    	uiModel.addAttribute("capableToEditValidDates", getActualUserDetails().isCapableToEditValidDates(product));
    }
	

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Product());
        return "admin/products/create";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("product_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("product_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("product_validfrom_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("product_validto_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
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

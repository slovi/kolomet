package cz.kolomet.web.pub;
import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.Product;
import cz.kolomet.dto.ProductFilterDto;
import cz.kolomet.repository.ProductAttributeRepository;
import cz.kolomet.repository.ProductSpecifications;
import cz.kolomet.repository.ProductUsageRepository;
import cz.kolomet.repository.RegionRepository;
import cz.kolomet.service.BicycleCategoryService;
import cz.kolomet.service.ProductColorService;
import cz.kolomet.service.ProductService;

@RequestMapping("/public/products")
@Controller("publicProductController")
public class ProductController extends AbstractPublicController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductAttributeRepository productAttributeRepository;
	
	@Autowired
	private RegionRepository regionRepository;
	
	@Autowired
	private ProductUsageRepository productUsageRepository;
	
	@Autowired
	private BicycleCategoryService bicycleCategoryService;
	
	@Autowired
	private ProductColorService productColorService;	
	
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model, HttpServletRequest request) {
		
		Product product = productService.detail(id, request.getRemoteAddr());
		model.addAttribute("product", product);
		model.addAttribute("productAttributes", productAttributeRepository.findByProductOrderByAttributeType_SequenceNr(product));
		return "public/products/detail";
	}
	
	@RequestMapping("/filter")
	public String filterByProductFilter(@Valid ProductFilterDto productFilter, BindingResult result, Model model, @PageableDefault(DEFAULT_PAGE_SIZE) Pageable pageable) {	
		populateFilterForm(productFilter, model);
		
		Pageable orderedPageable = new PageRequest(pageable.getPageNumber(), pageable.getPageSize(), ProductSpecifications.getDefaultSort(pageable.getSort()));
		model.addAttribute("products", productService.findProductEntries(ProductSpecifications.forProductFilter(productFilter), orderedPageable));
		return "public/products/list_category";
	}
	
	private void populateFilterForm(ProductFilterDto productFilter, Model model) {	
		
		if (productFilter.getPriceTo() == null) {
			BigDecimal maxPrice = productService.findMaxPrice();
			productFilter.setPriceTo(maxPrice);
			productFilter.setMaxPriceTo(maxPrice);
		}
		if (productFilter.getDiscountTo() == null) {
			BigDecimal maxDiscount = productService.findMaxDiscount();
			productFilter.setDiscountTo(maxDiscount);
			productFilter.setMaxDiscountTo(maxDiscount);
		}
		if (productFilter.getWeightTo() == null) {
			Double maxWeight = productService.findMaxWeight();
			if (maxWeight != null) {
				productFilter.setWeightTo(maxWeight);
				productFilter.setMaxWeightTo(maxWeight);
			}
		}
		if (productFilter.getPriceFrom() == null) {
			productFilter.setPriceFrom(BigDecimal.ZERO);
		}
		if (productFilter.getDiscountFrom() == null) {
			productFilter.setDiscountFrom(BigDecimal.ZERO);
		}
		if (productFilter.getWeightFrom() == null) {
			productFilter.setWeightFrom(0d);
		}
		
		model.addAttribute("regions", regionRepository.findAll());
		model.addAttribute("productusages", productUsageRepository.findAll());
		model.addAttribute("productcolors", productColorService.findAllProductColors());
		model.addAttribute("bicyclecategories", bicycleCategoryService.findAllBicycleCategorys());
		model.addAttribute("productFilter", productFilter);
	}
	
}

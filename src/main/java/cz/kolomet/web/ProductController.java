package cz.kolomet.web;
import java.math.BigDecimal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.dto.ProductFilterDto;
import cz.kolomet.repository.ProductRepository;
import cz.kolomet.repository.ProductSpecifications;
import cz.kolomet.repository.ProductUsageRepository;
import cz.kolomet.repository.RegionRepository;
import cz.kolomet.service.BicycleCategoryService;

@RequestMapping("/public/products")
@Controller("publicProductController")
public class ProductController extends AbstractController {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private RegionRepository regionRepository;
	
	@Autowired
	private ProductUsageRepository productUsageRepository;
	
	@Autowired
	private BicycleCategoryService bicycleCategoryService;
	
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model) {
		
		model.addAttribute("product", productRepository.findOne(id));
		return "products/detail";
	}
	
	@RequestMapping("/filter")
	public String filterByProductFilter(@Valid ProductFilterDto productFilter, BindingResult result, Model model, @PageableDefaults(pageNumber = 0, value = 6) Pageable pageable) {	
		populateFilterForm(productFilter, model);
		
		Pageable orderedPageable = new PageRequest(pageable.getPageNumber(), pageable.getPageSize(), ProductSpecifications.getDefaultSort(pageable.getSort()));
		model.addAttribute("products", productRepository.findAll(ProductSpecifications.forProductFilter(productFilter), orderedPageable));
		return "products/list_category";
	}
	
	private void populateFilterForm(ProductFilterDto productFilter, Model model) {	
		
		if (productFilter.getPriceTo() == null) {
			BigDecimal maxPrice = productRepository.findMaxPrice();
			productFilter.setPriceTo(maxPrice);
			productFilter.setMaxPriceTo(maxPrice);
		}
		if (productFilter.getDiscountTo() == null) {
			BigDecimal maxDiscount = productRepository.findMaxDiscount();
			productFilter.setDiscountTo(maxDiscount);
			productFilter.setMaxDiscountTo(maxDiscount);
		}
		if (productFilter.getWeightTo() == null) {
			Integer maxWeight = productRepository.findMaxWeight();
			productFilter.setWeightTo(maxWeight);
			productFilter.setMaxWeightTo(maxWeight);
		}
		if (productFilter.getPriceFrom() == null) {
			productFilter.setPriceFrom(BigDecimal.ZERO);
		}
		if (productFilter.getDiscountFrom() == null) {
			productFilter.setDiscountFrom(BigDecimal.ZERO);
		}
		if (productFilter.getWeightFrom() == null) {
			productFilter.setWeightFrom(0);
		}
		
		model.addAttribute("regions", regionRepository.findAll());
		model.addAttribute("productusages", productUsageRepository.findAll());
		model.addAttribute("bicyclecategories", bicycleCategoryService.findAllBicycleCategories());
		model.addAttribute("productFilter", productFilter);
	}
	
}

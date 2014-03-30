package cz.kolomet.web;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.Producer;
import cz.kolomet.dto.ProductFilter;
import cz.kolomet.repository.CategoryRepository;
import cz.kolomet.repository.ProducerRepository;
import cz.kolomet.repository.ProductRepository;
import cz.kolomet.repository.ProductSpecifications;

@RequestMapping("/public/products")
@Controller("publicProductController")
public class ProductController extends AbstractController {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private ProducerRepository producerRepository;
	
	private Integer maxPageItems = 6;
	
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model) {
		
		model.addAttribute("product", productRepository.findOne(id));
		return "products/detail";
	}
	
	@RequestMapping("/filter")
	public String filterByProductFilter(@Valid ProductFilter productFilter, BindingResult result, Model model, Pageable pageable) {	
		populateFilterForm(productFilter, null, null, model);
		model.addAttribute("products", productRepository.findAll(ProductSpecifications.forProductFilter(productFilter), pageable));
		return "products/list_category";
	}
	
	// TODO: predelat category na long
	@RequestMapping("/category/{categoryCodeKey}")
	public String listByCategory(@PathVariable("categoryCodeKey") String categoryCodeKey, Model model) {
		populateFilterForm(new ProductFilter(), categoryCodeKey, null, model);
		if (!categoryCodeKey.equals(Category.ALL_CATEGORY_CODE_KEY)) {
			model.addAttribute("products", productRepository.findByCategory(categoryCodeKey, new PageRequest(0, maxPageItems)));
		} else {
			model.addAttribute("products", productRepository.findByPriority(new PageRequest(0, maxPageItems)));
		}
		return "products/list_category";
	}
	
	@RequestMapping("/producer/{producerId}")
	public String listByProducer(@PathVariable("producerId") Long producerId, Model model) {
		Producer producer = producerRepository.findOne(producerId);
		populateFilterForm(new ProductFilter(), null, producer, model);
		model.addAttribute("products", productRepository.findByProducerOrderByCreatedDateDesc(producer, new PageRequest(0, maxPageItems)));
		return "products/list_category";
	}
	
	@RequestMapping("/categorytype/{categoryTypeCodeKey}")
	public String listByCategoryType(@PathVariable("categoryTypeCodeKey") String categoryTypeCodeKey, Model model) {
		populateFilterForm(new ProductFilter(), null, null, model);
		model.addAttribute("products", productRepository.findByCategoryType(categoryTypeCodeKey, new PageRequest(0, maxPageItems)));		
		return "products/list_category";
	}
	
	private void populateFilterForm(ProductFilter productFilter, String categoryCodeKey, Producer producer, Model model) {		
		if (StringUtils.isNotEmpty(categoryCodeKey)) {
			Category category = categoryRepository.findByCodeKey(categoryCodeKey).get(0);
			productFilter.setCategory(category);
		}
		if (producer != null) {
			productFilter.setProducer(producer);
		}
		model.addAttribute("producers", producerRepository.findAll());
		model.addAttribute("productFilter", productFilter);
	}
	
}

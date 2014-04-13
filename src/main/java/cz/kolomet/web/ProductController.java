package cz.kolomet.web;
import javax.validation.Valid;

import org.springframework.beans.factory.InitializingBean;
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
import cz.kolomet.dto.ProductFilterDto;
import cz.kolomet.repository.CategoryRepository;
import cz.kolomet.repository.ProducerRepository;
import cz.kolomet.repository.ProductRepository;
import cz.kolomet.repository.ProductSpecifications;
import cz.kolomet.repository.ProductUsageRepository;
import cz.kolomet.repository.RegionRepository;

@RequestMapping("/public/products")
@Controller("publicProductController")
public class ProductController extends AbstractController implements InitializingBean {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private ProducerRepository producerRepository;
	
	@Autowired
	private RegionRepository regionRepository;
	
	@Autowired
	private ProductUsageRepository productUsageRepository;
	
	private Integer maxPageItems = 6;
	
	private PageRequest pageRequest;
	
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model) {
		
		model.addAttribute("product", productRepository.findOne(id));
		return "products/detail";
	}
	
	@RequestMapping("/filter")
	public String filterByProductFilter(@Valid ProductFilterDto productFilter, BindingResult result, Model model, Pageable pageable) {	
		populateFilterForm(productFilter, null, null, model);
		
		Pageable orderedPageable = new PageRequest(pageable.getPageNumber(), pageable.getPageSize(), ProductSpecifications.getDefaultSort());
		model.addAttribute("products", productRepository.findAll(ProductSpecifications.forProductFilter(productFilter), orderedPageable));
		return "products/list_category";
	}
	
	// TODO: predelat category na long
	@RequestMapping("/category/{categoryId}")
	public String listByCategory(@PathVariable("categoryId") Long categoryId, Model model) {
		Category category = categoryRepository.findOne(categoryId);
		populateFilterForm(new ProductFilterDto(), category, null, model);
		model.addAttribute("products", productRepository.findByCategory(category, pageRequest));
		return "products/list_category";
	}
	
	@RequestMapping("/producer/{producerId}")
	public String listByProducer(@PathVariable("producerId") Long producerId, Model model) {
		Producer producer = producerRepository.findOne(producerId);
		populateFilterForm(new ProductFilterDto(), null, producer, model);
		model.addAttribute("products", productRepository.findByProducerOrderByCreatedDateDesc(producer, pageRequest));
		return "products/list_category";
	}
	
	@RequestMapping("/categorytype/{categoryTypeCodeKey}")
	public String listByCategoryType(@PathVariable("categoryTypeCodeKey") String categoryTypeCodeKey, Model model) {
		populateFilterForm(new ProductFilterDto(), null, null, model);
		model.addAttribute("products", productRepository.findByCategoryType(categoryTypeCodeKey, pageRequest));		
		return "products/list_category";
	}
	
	private void populateFilterForm(ProductFilterDto productFilter, Category category, Producer producer, Model model) {		
		if (category != null) {
			productFilter.setCategory(category);
		}
		if (producer != null) {			
			productFilter.setProducer(producer);
		}
		model.addAttribute("producers", producerRepository.findAll());
		model.addAttribute("regions", regionRepository.findAll());
		model.addAttribute("productusages", productUsageRepository.findAll());
		model.addAttribute("productFilter", productFilter);
	}
	
	@Override
	public void afterPropertiesSet() throws Exception {
		this.pageRequest = new PageRequest(0, maxPageItems, ProductSpecifications.getDefaultSort());
	}
	
}

package cz.kolomet.service.impl;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.ProductState;
import cz.kolomet.domain.VisitorActivityLog.VisitorActivityType;
import cz.kolomet.repository.CategoryRepository;
import cz.kolomet.repository.ProductRepository;
import cz.kolomet.service.ProductService;
import cz.kolomet.service.VisitorActivityLogService;
import cz.kolomet.service.exception.EntityNotFoundException;

@Service
@Transactional
public class ProductServiceImpl implements ProductService, InitializingBean {
	
	@Value("${img.rootdir}")
	protected String rootDir;
	
	private Category categoryScooter;
	
	private Category categoryChildren;
	
	private List<Category> categoriesChildrenAndScooter;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private VisitorActivityLogService visitorActivityLogService;

	@Autowired
    private ProductRepository productRepository;
	
	@Override
	@PreAuthorize("principal.isCapableToDeleteProduct(#product)")
	@CacheEvict(value = "cz.kolomet.domain.Product.values.max", allEntries = true)
    public void deleteProduct(Product product) {
        product.setEnabled(false);
        product.setValidTo(new Date());
        product.setProductState(ProductState.DELETED);        
    }
	
	@Override
	@PostAuthorize("isAnonymous() or principal.isCapableToDisplayProduct(returnObject)")
	public Product detail(Long id, String userInfo) {
		Product product = findProduct(id);
		if (product == null) {
			throw new EntityNotFoundException(id);
		}
		product.simplifyName();
		visitorActivityLogService.saveVisitorActivityLog(product.getSeller(), product, userInfo, VisitorActivityType.PRODUCT_VISIT);
		return product;
	}
	
	@Override
	public Page<Product> findCurrentAndNextPage(Specification<Product> specification, Pageable pageable) {
		Page<Product> products = productRepository.findCurrentAndNextPage(specification, pageable);
		// TODO temp
		for (Product product: products) {
			product.simplifyName();
		}
		return products;
	}
    
	@Override
	public List<Product> findRandomByPriority(Pageable pageable) {
		
		Pageable randomPageRequest = new PageRequest(pageable.getPageNumber(), 10, pageable.getSort());
		
		List<Product> products = new ArrayList<Product>(); 
		products.addAll(productRepository.findByPriorityAndCategory(randomPageRequest, categoryChildren));
		products.addAll(productRepository.findByPriorityAndCategory(randomPageRequest, categoryScooter));
		products.addAll(productRepository.findByPriorityAndNotCategoryIn(randomPageRequest, categoriesChildrenAndScooter));
		
		if (products.size() > pageable.getPageSize()) {
			List<Product> resultList = new ArrayList<Product>(products);
			for (Product product: resultList) { // TODO temp
				product.simplifyName(); 
			}
			Collections.shuffle(resultList);
			return resultList.subList(0, pageable.getPageSize());
		} else {
			return products;
		}
	}
	
	@PostAuthorize("isAnonymous() or principal.isCapableToDisplayProduct(returnObject)")
    public Product findProduct(Long id) {
        return productRepository.findOne(id);
    }
    
	@PreAuthorize("principal.isCapableToSaveProduct(#product)")
	@CacheEvict(value = "cz.kolomet.domain.Product.values.max", allEntries = true)
    public void saveProduct(Product product) {
		
		// prepocitame cenu a ulozime (pokud se jedna o novy produkt, tak nastavime na activni)
		product.computeAndSetDiscount();
		if (product.isEmptyState()) {
			product.setProductState(ProductState.ACTIVE);
		}
		if (product.isCopyState()) {
			product.setProductState(ProductState.ACTIVE);
		}
		product.normalizeBuyUrl();
		product.simplifyName();
        productRepository.save(product);
    }
    
	@PreAuthorize("principal.isCapableToUpdateProduct(#product)")
	@CacheEvict(value = "cz.kolomet.domain.Product.values.max", allEntries = true)
    public Product updateProduct(Product product) {
		product.computeAndSetDiscount();		
		product.setProductState(ProductState.ACTIVE);
		product.normalizeBuyUrl();
		product.simplifyNameAnyway();
        return productRepository.save(product);
    }
	
	@Override
	public List<Product> findProductEntries(Specification<Product> specification) {
		return productRepository.findAll(specification);
	}
	
	@Override
	public Page<Product> findProductEntries(Specification<Product> specification, Pageable pageable) {
		return productRepository.findAll(specification, pageable);
	}
	
	public List<Product> findByPriority(Pageable pageable) {
		return productRepository.findByPriority(pageable);
	}
	
	public Page<Product> findProductEntriesWithoutCountQuery(Specification<Product> specification, Pageable pageable) {
		return productRepository.findCurrentAndNextPage(specification, pageable);
	}
	
	@Override
	public Product copyProduct(Long id) {
		return copyProduct(findProduct(id));
	}
	
	@Override
	@PreAuthorize("principal.isCapableToCopyProduct(#product)")
	public Product copyProduct(Product product) {
		Product newProduct = product.copy();
		newProduct.setValidFrom(new Date());
		if (newProduct.getValidTo() != null && newProduct.getValidTo().before(new Date())) {
			newProduct.setValidTo(Product.DEFAULT_VALID_TO_DATE);
		}
    	newProduct.setProductState(ProductState.COPY);
		return newProduct;
	}
	
	@Override
	@PreAuthorize("principal.isCapableToEraseProduct(#product)")
	@CacheEvict(value = "cz.kolomet.domain.Product.values.max", allEntries = true)
	public void eraseProduct(Product product) {
		productRepository.deleteCopiedFrom(product);
		productRepository.delete(product);
	}

	public long countAllProducts() {
        return productRepository.count();
    }

	public List<Product> findAllProducts() {
        return productRepository.findAll();
    }

	public List<Product> findProductEntries(int firstResult, int maxResults) {
        return productRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
	
	@Cacheable(value = "cz.kolomet.domain.Product.values.max", key = "'maxPrice'")
	public BigDecimal findMaxPrice() {
		return productRepository.findMaxPrice();
	}
	
	@Cacheable(value = "cz.kolomet.domain.Product.values.max", key = "'maxWeight'")
	public Double findMaxWeight() {
		return productRepository.findMaxWeight();
	}
	
	@Cacheable(value = "cz.kolomet.domain.Product.values.max", key = "'maxDiscount'")
	public BigDecimal findMaxDiscount() {
		return productRepository.findMaxDiscount();
	}
	
	@Override
	public void afterPropertiesSet() throws Exception {
		
		this.categoryChildren = categoryRepository.findByCodeKey("cat_bike_children");
		this.categoryScooter = categoryRepository.findByCodeKey("cat_bike_scooter");
		
		if (categoryChildren == null) {
			throw new IllegalStateException("category children cannot be null");
		}
		
		if (categoryScooter == null) {
			throw new IllegalStateException("category scooter cannot be null");
		}
		
		this.categoriesChildrenAndScooter = new ArrayList<Category>();
		this.categoriesChildrenAndScooter.add(categoryChildren);
		this.categoriesChildrenAndScooter.add(categoryScooter);
	}
	
}
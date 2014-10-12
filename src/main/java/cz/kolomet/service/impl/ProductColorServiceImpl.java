package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.ProductColor;
import cz.kolomet.repository.ProductColorRepository;
import cz.kolomet.service.ProductColorService;

@Service
@Transactional
public class ProductColorServiceImpl implements ProductColorService {
	
    public List<ProductColor> findAllProductColors() {
        return productColorRepository.findAll(Codelist.defaultSort());
    }
    
	public Page<ProductColor> findProductColorEntries(Pageable pageable) {
		return productColorRepository.findAll(pageable);
	}
	

	@Autowired
    ProductColorRepository productColorRepository;

	public long countAllProductColors() {
        return productColorRepository.count();
    }

	public void deleteProductColor(ProductColor productColor) {
        productColorRepository.delete(productColor);
    }

	public ProductColor findProductColor(Long id) {
        return productColorRepository.findOne(id);
    }

	public List<ProductColor> findProductColorEntries(int firstResult, int maxResults) {
        return productColorRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveProductColor(ProductColor productColor) {
        productColorRepository.save(productColor);
    }

	public ProductColor updateProductColor(ProductColor productColor) {
        return productColorRepository.save(productColor);
    }
}

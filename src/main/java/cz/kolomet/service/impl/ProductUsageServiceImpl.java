package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.ProductUsage;
import cz.kolomet.repository.ProductUsageRepository;
import cz.kolomet.service.ProductUsageService;

@Service
@Transactional
public class ProductUsageServiceImpl implements ProductUsageService {
	
    public List<ProductUsage> findAllProductUsages() {
        return productUsageRepository.findAll(Codelist.defaultSort());
    }
	
	public Page<ProductUsage> findProductUsageEntries(Pageable pageable) {
		return productUsageRepository.findAll(pageable);
	}
	

	@Autowired
    ProductUsageRepository productUsageRepository;

	public long countAllProductUsages() {
        return productUsageRepository.count();
    }

	public void deleteProductUsage(ProductUsage productUsage) {
        productUsageRepository.delete(productUsage);
    }

	public ProductUsage findProductUsage(Long id) {
        return productUsageRepository.findOne(id);
    }

	public List<ProductUsage> findProductUsageEntries(int firstResult, int maxResults) {
        return productUsageRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveProductUsage(ProductUsage productUsage) {
        productUsageRepository.save(productUsage);
    }

	public ProductUsage updateProductUsage(ProductUsage productUsage) {
        return productUsageRepository.save(productUsage);
    }
}

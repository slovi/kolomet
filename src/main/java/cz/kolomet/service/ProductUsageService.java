package cz.kolomet.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.ProductUsage;

public interface ProductUsageService {
	
	public Page<ProductUsage> findProductUsageEntries(Pageable pageable);
	

	public abstract long countAllProductUsages();


	public abstract void deleteProductUsage(ProductUsage productUsage);


	public abstract ProductUsage findProductUsage(Long id);


	public abstract List<ProductUsage> findAllProductUsages();


	public abstract List<ProductUsage> findProductUsageEntries(int firstResult, int maxResults);


	public abstract void saveProductUsage(ProductUsage productUsage);


	public abstract ProductUsage updateProductUsage(ProductUsage productUsage);

}

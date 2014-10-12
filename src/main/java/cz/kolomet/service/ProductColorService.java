package cz.kolomet.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.ProductColor;

public interface ProductColorService {
	
	public Page<ProductColor> findProductColorEntries(Pageable pageable);
	

	public abstract long countAllProductColors();


	public abstract void deleteProductColor(ProductColor productColor);


	public abstract ProductColor findProductColor(Long id);


	public abstract List<ProductColor> findAllProductColors();


	public abstract List<ProductColor> findProductColorEntries(int firstResult, int maxResults);


	public abstract void saveProductColor(ProductColor productColor);


	public abstract ProductColor updateProductColor(ProductColor productColor);

}

package cz.kolomet.service;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.Seller;

public interface SellerService {
	
	
	public void eraseSeller(Seller seller);
	
	
	public Page<Seller> findSellerEntries(Pageable pageable);
	

	public abstract long countAllSellers();


	public abstract void deleteSeller(Seller seller);


	public abstract Seller findSeller(Long id);

	
	public abstract List<Seller> findAllSellers();
	
	
	public abstract List<Seller> findAllEnabledSellers();
	

	public abstract List<Seller> findSellerEntries(int firstResult, int maxResults);


	public abstract void saveSeller(Seller seller);


	public abstract Seller updateSeller(Seller seller);

}

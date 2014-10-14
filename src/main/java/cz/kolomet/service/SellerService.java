package cz.kolomet.service;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.Seller;

public interface SellerService {
	
	
	public void eraseSeller(Seller seller);
	
	
	public Page<Seller> findSellerEntries(Pageable pageable);
	
	
	public List<Seller> findByRegionCodeKeyOrderBySellerNameAsc(String regionCodeKey);
	

	public long countAllSellers();


	public void deleteSeller(Seller seller);


	public Seller detail(Long id, String userInfo);
	
	
	public Seller findSeller(Long id);

	
	public List<Seller> findAllSellers();
	
	
	public List<Seller> findAllEnabledSellers();
	

	public List<Seller> findSellerEntries(int firstResult, int maxResults);


	public void saveSeller(Seller seller);


	public Seller updateSeller(Seller seller);

}

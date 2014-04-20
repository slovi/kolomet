package cz.kolomet.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PostFilter;
import org.springframework.security.access.prepost.PreAuthorize;

import cz.kolomet.domain.Seller;
import cz.kolomet.repository.SellerRepository;
import cz.kolomet.service.SellerService;

public class SellerServiceImpl implements SellerService {
	
	@Autowired
	private SellerRepository sellerRepository;
	
	public Page<Seller> findSellerEntries(Pageable pageable) {
		return sellerRepository.findAll(pageable);
	}
    
	@PreAuthorize("hasRole('ROLE_per_sellers_all')")
    public void deleteSeller(Seller seller) {
        sellerRepository.delete(seller);
    }
    
	@PostAuthorize("isAnonymous() or hasRole('ROLE_per_sellers_all') or returnObject.id == principal.sellerId")
    public Seller findSeller(Long id) {
        return sellerRepository.findOne(id);
    }
    
    @PreAuthorize("hasRole('ROLE_per_sellers_all') or #seller.id == principal.sellerId")
    public void saveSeller(Seller seller) {
        sellerRepository.save(seller);
    }
    
    @PreAuthorize("hasRole('ROLE_per_sellers_all') or #seller.id == principal.sellerId")
    public Seller updateSeller(Seller seller) {
        return sellerRepository.save(seller);
    }
    
    @PreAuthorize("hasRole('ROLE_per_sellers_all')")
    public long countAllSellers() {
        return sellerRepository.count();
    }
    
    @PostFilter("hasPermission(filterObject, 'read')")
    public List<Seller> findAllSellers() {
        return sellerRepository.findAll();
    }
    
    @PreAuthorize("hasRole('ROLE_per_sellers_all')")
    public List<Seller> findSellerEntries(int firstResult, int maxResults) {
        return sellerRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
	
}

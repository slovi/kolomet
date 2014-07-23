package cz.kolomet.service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.Seller;

@RooService(domainTypes = { cz.kolomet.domain.Seller.class })
public interface SellerService {
	
	public void eraseSeller(Seller seller);
	
	public Page<Seller> findSellerEntries(Pageable pageable);
	
}

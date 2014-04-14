package cz.kolomet.service.impl;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.Seller;
import cz.kolomet.service.SellerService;

public class SellerServiceImpl implements SellerService {
	
	public Page<Seller> findSellerEntries(Pageable pageable) {
		return sellerRepository.findAll(pageable);
	}
	
}

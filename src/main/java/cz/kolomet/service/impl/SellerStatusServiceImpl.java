package cz.kolomet.service.impl;

import cz.kolomet.domain.codelist.SellerStatus;
import cz.kolomet.service.SellerStatusService;

public class SellerStatusServiceImpl implements SellerStatusService {
	
	public SellerStatus findSellerStatus(String code) {
		return sellerStatusRepository.findByCodeKey(code);
	}
	
}

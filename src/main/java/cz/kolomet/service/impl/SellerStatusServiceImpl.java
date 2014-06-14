package cz.kolomet.service.impl;

import java.util.List;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.SellerStatus;
import cz.kolomet.service.SellerStatusService;

public class SellerStatusServiceImpl implements SellerStatusService {
	
	public SellerStatus findSellerStatus(String code) {
		return sellerStatusRepository.findByCodeKey(code);
	}
	
    public List<SellerStatus> findAllSellerStatuses() {
        return sellerStatusRepository.findAll(Codelist.defaultSort());
    }
	
}

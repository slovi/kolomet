package cz.kolomet.service;

import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.codelist.SellerStatus;

@RooService(domainTypes = { cz.kolomet.domain.codelist.SellerStatus.class })
public interface SellerStatusService {
	
	public SellerStatus findSellerStatus(String code);
	
}

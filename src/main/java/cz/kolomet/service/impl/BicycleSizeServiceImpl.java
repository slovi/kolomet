package cz.kolomet.service.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.BicycleSize;
import cz.kolomet.service.BicycleSizeService;

public class BicycleSizeServiceImpl implements BicycleSizeService {
	
	public Page<BicycleSize> findBicycleSizeEntries(Pageable pageable) {
		return bicycleSizeRepository.findAll(pageable);
	}
	
}

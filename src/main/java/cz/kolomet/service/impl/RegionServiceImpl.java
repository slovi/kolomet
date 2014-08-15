package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.service.RegionService;

public class RegionServiceImpl implements RegionService {
	
	public Page<Region> findRegionEntries(Pageable pageable) {
		return regionRepository.findAll(pageable);
	}
	
    public List<Region> findAllRegions() {
        return regionRepository.findAll(Codelist.defaultSort());
    }
    
    public Region findByGoogleAlias(String googleAlias) {
    	return regionRepository.findByGoogleAlias(googleAlias);
    }
    
}

package cz.kolomet.service.impl;

import java.util.List;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.service.RegionService;

public class RegionServiceImpl implements RegionService {
	
    public List<Region> findAllRegions() {
        return regionRepository.findAll(Codelist.defaultSort());
    }
    
}
